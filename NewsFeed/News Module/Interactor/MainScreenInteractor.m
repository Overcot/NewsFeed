//
//  MainScreenNewsInteractor.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "MainScreenInteractor.h"

@implementation MainScreenInteractor

static NSString *const urlAttributesFileName = @"urlPList";
static NSString *const urlAttributesFileExtension = @"plist";

static NSString *const urlStringFormat = @"%@?country=%@&apiKey=%@";

static NSString *const pListAddressPropertyName = @"address";
static NSString *const pListCountryCodePropertyName = @"countryCode";
static NSString *const pListApiKeyPropertyName = @"apiKey";

static NSString *const dateFromFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
static NSString *const dateToFormat = @"HH:mm, dd-MM-yyyy";

static NSString *const fromAbbreviation = @"GMT";
static NSString *const toAbbreviation = @"Moscow";

static NSString *const JSONArticle = @"articles";
static NSString *const JSONDateProperty = @"publishedAt";
static NSString *const JSONTitleProperty = @"title";
static NSString *const JSONDescriptionProperty = @"description";


@synthesize presenter = _presenter;
@synthesize newsList = _newsList;
@synthesize urlString = _urlString;

- (instancetype) init {
    self = [super init];
    if (self) {
        [self getUrlString];
        [self refreshNews];
    }
    return self;
}

- (void) getUrlString {
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlAttributesFileName ofType:urlAttributesFileExtension]];
    
    NSString *address = [dict objectForKey:pListAddressPropertyName];
    NSString *countryCode = [dict objectForKey:pListCountryCodePropertyName];
    NSString *apiKey = [dict objectForKey:pListApiKeyPropertyName];
    
    _urlString = [[NSString alloc] initWithFormat:urlStringFormat, address, countryCode, apiKey];
}

- (id<NewsModelProtocol>) getNewsAtIndex:(NSInteger) index {
    return _newsList[index];
}

- (int) getNewsCount {
    return (int)_newsList.count;
}

- (void) refreshNews {
    [self downloadNewsFromString:_urlString];
}

- (void) downloadNewsFromString:(NSString *)urlString{
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *data = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            if (data != nil) {
                NSError *erro = nil;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erro];
                NSMutableArray<NewsModelProtocol> *news = [[NSMutableArray<NewsModelProtocol> alloc] init];
                for (NSDictionary *newsDict in json[JSONArticle]) {
                    id<NewsModelProtocol> element = [[NewsComponents alloc] initWithDate:[weakSelf convertDate:newsDict[JSONDateProperty]] title:newsDict[JSONTitleProperty] description:newsDict[JSONDescriptionProperty]];
                    
                    [news addObject:element];
                }
                weakSelf.newsList = [[NSArray<NewsModelProtocol> alloc] initWithArray:news];
            }
            
        } else {
            [self.presenter errorDownloading];
        }
        dispatch_sync(dispatch_get_main_queue(),^{
            
            [weakSelf.presenter didFinishDownload];
        });
    }];
    [data resume];
}

- (NSString *) convertDate:(NSString*)dateString{
    // create dateFormatter with UTC time format
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:fromAbbreviation]];
    [dateFormatter setDateFormat:dateFromFormat];
    
    NSDate *date = [dateFormatter dateFromString:dateString]; // create date from string
    // change to a readable time format and change to local time zone
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:toAbbreviation]];
    [dateFormatter setDateFormat:dateToFormat];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)getDateAtIndex:(int) index {
    id<NewsModelProtocol> element = [self getNewsAtIndex:index];
    return element.date;
}

- (NSString *)getDescrAtIndex:(int)index {
    id<NewsModelProtocol> element = [self getNewsAtIndex:index];
    return element.descr;
}

- (NSString *)getTitleAtIndex:(int)index {
    id<NewsModelProtocol> element = [self getNewsAtIndex:index];
    return element.title;

}


@end
