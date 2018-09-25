//
//  MainScreenNewsInteractor.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenInteractor.h"
#import "NewsComponents.h"
#import <CoreData/CoreData.h>
#import "AFAppDelegate.h"
@interface NewsMainScreenInteractor ()

@property (nonatomic, weak) id<NewsMainScreenPresenterProtocol> presenter;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSArray <NewsModelProtocol> *newsList;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) AFAppDelegate *appDelegate;
@end


@implementation NewsMainScreenInteractor

static NSString *const emptyString = @"";

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

static NSString *const newsEntityName = @"News";
static NSString *const dateName = @"date";

@synthesize presenter = _presenter;
@synthesize newsList = _newsList;
@synthesize urlString = _urlString;
@synthesize appDelegate = _appDelegate;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self getUrlString];
        self.appDelegate = (AFAppDelegate *)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = self.appDelegate.managedObjectContext;
    }
    return self;
}

#pragma mark - <NewsMainScreenInteractorProtocol>

- (id<NewsModelProtocol>)getNewsAtIndex:(NSInteger) index {
    id<NewsModelProtocol> element = self.newsList[index];

    return element;
}

- (NSUInteger)getNewsCount {
    return self.newsList.count;
}

- (void)refreshNews {
    self.newsList = [self getArrayFromContext];
    [self downloadNewsFromString:self.urlString];
}

#pragma mark - Interactor methods

- (void)getUrlString {
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlAttributesFileName ofType:urlAttributesFileExtension]];
    
    NSString *address = [dict objectForKey:pListAddressPropertyName];
    NSString *countryCode = [dict objectForKey:pListCountryCodePropertyName];
    NSString *apiKey = [dict objectForKey:pListApiKeyPropertyName];
    
    self.urlString = [[NSString alloc] initWithFormat:urlStringFormat, address, countryCode, apiKey];
}

- (void)downloadNewsFromString:(NSString *)urlString{
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *data = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil && data != nil) {
            NSError *erro = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erro];
            if (erro == nil) {
                [self clearData];
                [self addNewData:json];
            } else {
                [self.presenter errorDownloading];
            }
        } else {
            [self.presenter errorDownloading];
        }
        weakSelf.newsList = [self getArrayFromContext];
        dispatch_sync(dispatch_get_main_queue(),^{
            [weakSelf.presenter didFinishDownload];
        });
    }];
    [data resume];
}


- (NSArray<NewsModelProtocol> *)getArrayFromContext {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:newsEntityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:dateName ascending:NO];

    [fetchRequest setSortDescriptors:[[NSArray alloc] initWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray<NewsModelProtocol> *fetchedObjects = (NSArray<NewsModelProtocol> *)[self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"error");
    }
    return fetchedObjects;
}

- (void)clearData {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:newsEntityName];
    NSBatchDeleteRequest *batchDeleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
    NSError *error = nil;
    [self.managedObjectContext executeRequest:batchDeleteRequest error:&error];
}

- (void)addNewData:(NSDictionary *)json {
    for (NSDictionary *newsDict in json[JSONArticle]) {
        NewsComponents *item = [NSEntityDescription insertNewObjectForEntityForName:newsEntityName inManagedObjectContext:self.appDelegate.managedObjectContext];
        item.date = [self convertStringToDate:newsDict[JSONDateProperty]];
        item.title = (![newsDict[JSONTitleProperty] isKindOfClass:[NSNull class]]) ? newsDict[JSONTitleProperty] : emptyString;
        item.descr = (![newsDict[JSONDescriptionProperty] isKindOfClass:[NSNull class]]) ? newsDict[JSONDescriptionProperty] : emptyString;
    }
    [self.appDelegate saveContext];
}

- (NSDate *)convertStringToDate:(NSString*)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:fromAbbreviation]];
    [dateFormatter setDateFormat:dateFromFormat];
    NSDate *date = [dateFormatter dateFromString:dateString]; // create date from string
    return date;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self getNewsCount];
}


@end
