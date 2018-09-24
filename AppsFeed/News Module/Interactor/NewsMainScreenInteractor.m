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

@interface NewsMainScreenInteractor ()

@property (nonatomic, weak) id<NewsMainScreenPresenterProtocol> presenter;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSArray <NewsModelProtocol> *newsList;
@property (nonatomic, strong, readonly) NSPersistentContainer *persistentContainer;

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

@synthesize presenter = _presenter;
@synthesize newsList = _newsList;
@synthesize urlString = _urlString;
@synthesize persistentContainer = _persistentContainer;
- (instancetype)init {
    self = [super init];
    if (self) {
        [self getUrlString];
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
                NSMutableArray<NewsModelProtocol> *news = [[NSMutableArray<NewsModelProtocol> alloc] init];
                for (NSDictionary *newsDict in json[JSONArticle]) {
                    id<NewsModelProtocol> element = [[NewsComponents alloc] initWithDate:[weakSelf convertDate:newsDict[JSONDateProperty]] title:newsDict[JSONTitleProperty] description:newsDict[JSONDescriptionProperty]];

                    [news addObject:element];
                    

                    
                    /*
                    NewsComponents *entity = [NSEntityDescription insertNewObjectForEntityForName:@"News" inManagedObjectContext:context];*/
                    /*
                    [entity setDate:(NSString *)];
                    [entity setValue:element.date forKey:@"date"];
                    [entity setValue:element.title forKey:@"title"];
                    [entity setValue:element.descr forKey:@"descr"];
                    */
                    /*
                    if ([context hasChanges] && ![context save:&error]) {
                        // Replace this implementation with code to handle the error appropriately.
                        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                        abort();
                    }*/
                    
                    
                }
                NSManagedObjectContext *context = self.persistentContainer.viewContext;
                NSError *error = nil;
                NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Name"];
                NSArray *result = [fetchRequest execute:&error];
                weakSelf.newsList = [news copy];
            } else {
                [self.presenter errorDownloading];
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

- (NSString *)convertDate:(NSString*)dateString{
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self getNewsCount];
}


- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"NewsData"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}
@end
