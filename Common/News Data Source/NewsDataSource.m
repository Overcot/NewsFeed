//
//  NewsDataSource.m
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsDataSource.h"
#import <CoreData/CoreData.h>
#import "AFAppDelegate.h"
#import "NewsComponents.h"

@interface NewsDataSource ()
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSArray <NewsModelProtocol> *newsList;

@property (nonatomic, weak) AFAppDelegate *appDelegate;


@end

@implementation NewsDataSource
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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getUrlString];
        self.appDelegate = (AFAppDelegate *)[[UIApplication sharedApplication] delegate];
        self.childObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        self.childObjectContext.parentContext = self.appDelegate.managedObjectContext;
    }
    return self;
}

- (void)getUrlString {
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlAttributesFileName ofType:urlAttributesFileExtension]];
    
    NSString *address = [dict objectForKey:pListAddressPropertyName];
    NSString *countryCode = [dict objectForKey:pListCountryCodePropertyName];
    NSString *apiKey = [dict objectForKey:pListApiKeyPropertyName];
    
    self.urlString = [[NSString alloc] initWithFormat:urlStringFormat, address, countryCode, apiKey];
}
- (NSUInteger)getNewsCount {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:newsEntityName inManagedObjectContext:self.childObjectContext];
    [fetchRequest setEntity:entity];

    NSError *error = nil;
    NSArray<NewsModelProtocol> *fetchedObjects = (NSArray<NewsModelProtocol> *)[self.childObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"error");
    }
    return fetchedObjects.count;

}

- (void)downloadNewsFromURL{
    
    NSURLSession *session = [NSURLSession sharedSession];
    //__weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *data = [session dataTaskWithURL:[NSURL URLWithString:[self urlString]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil && data != nil) {
            NSError *erro = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erro];
            if (erro == nil) {
                [self didDownloadData:json];
            } else {
            }
        } else {
        }
        dispatch_sync(dispatch_get_main_queue(),^{
        });
    }];
    [data resume];
}

- (NSArray<NewsModelProtocol> *)getNewsFromContext {

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:newsEntityName inManagedObjectContext:self.childObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:dateName ascending:NO];
    [fetchRequest setSortDescriptors:[[NSArray alloc] initWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray<NewsModelProtocol> *fetchedObjects = (NSArray<NewsModelProtocol> *)[self.childObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"error");
    }
    return fetchedObjects;
}

- (void)clearAllData {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:newsEntityName];
    NSBatchDeleteRequest *batchDeleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
    [self.childObjectContext performBlock:^{
        NSError *childError = nil;
        [self.childObjectContext executeRequest:batchDeleteRequest error:&childError];
        if (![self.childObjectContext save:&childError]) {
            NSLog(@"Child context clear error");
        }
        [self.childObjectContext.parentContext performBlockAndWait:^{
            NSError *parentError = nil;
            if (![self.childObjectContext.parentContext save:&parentError]) {
                NSLog(@"Parent context clear error");
            }
        }];
    }];
}

- (void)didDownloadData:(NSDictionary *)json {
    for (NSDictionary *newsDict in json[JSONArticle]) {
        
        NSString *title = [self getTitle:newsDict];
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:newsEntityName];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == %@", title];
        [fetchRequest setPredicate:predicate];
        NSError *error = nil;
        NSArray<NewsModelProtocol>* result = (NSArray<NewsModelProtocol> *)[self.childObjectContext executeRequest:fetchRequest error:&error];
        //  bug here
        if(result.count == 0) {
            [self addDataToContext:newsDict];
        }
    }
    // need to change maybe - need to save main context only after child one
    [self.childObjectContext.parentContext performBlockAndWait:^{
        NSError *parentError = nil;
        if (![self.childObjectContext.parentContext save:&parentError]) {
            NSLog(@"Parent context clear error");
        }
    }];
}

- (void)addDataToContext:(NSDictionary *)newsObject {
    NewsComponents *item = [NSEntityDescription insertNewObjectForEntityForName:newsEntityName inManagedObjectContext:self.childObjectContext];
    item.date = [self getDate:newsObject];
    item.title = [self getTitle:newsObject];
    item.descr = [self getDesr:newsObject];
    
    [self.childObjectContext performBlock:^{
        NSError *childError = nil;
        if (![self.childObjectContext save:&childError]) {
            NSLog(@"Child context clear error");
        }
    }];
}

- (NSDate *)getDate:(NSDictionary *)newsObject {
    return [self convertStringToDate:newsObject[JSONDateProperty]];
}

- (NSString *)getTitle:(NSDictionary *)newsObject {
    return (![newsObject[JSONTitleProperty] isKindOfClass:[NSNull class]]) ? newsObject[JSONTitleProperty] : emptyString;
}

- (NSString *)getDesr:(NSDictionary *)newsObject {
    return (![newsObject[JSONDescriptionProperty] isKindOfClass:[NSNull class]]) ? newsObject[JSONDescriptionProperty] : emptyString;
}

- (NSDate *)convertStringToDate:(NSString*)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:fromAbbreviation]];
    [dateFormatter setDateFormat:dateFromFormat];
    NSDate *date = [dateFormatter dateFromString:dateString]; // create date from string
    return date;
}
@end
