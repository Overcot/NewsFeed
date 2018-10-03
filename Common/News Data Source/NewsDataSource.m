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
#import "NewsDataObserverProtocol.h"
#import "AF_NSDate+NSString.h"


@interface NewsDataSource ()

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSPointerArray <NewsDataObserverProtocol> *observers;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)getUrlString;
- (NSDate *)getDate:(NSDictionary *)newsObject;
- (NSString *)getTitle:(NSDictionary *)newsObject;
- (NSString *)getDesr:(NSDictionary *)newsObject;

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

static NSString *const newsDataModelName = @"NewsData";


- (instancetype)init {
    self = [super init];
    if (self) {
        self.observers = [[NSPointerArray<NewsDataObserverProtocol> alloc] initWithOptions:NSPointerFunctionsWeakMemory];
        [self getUrlString];
    }
    return self;
}

#pragma mark - Private Utility Methods

- (NSDate *)getDate:(NSDictionary *)newsObject {
    //return [[[NSDate alloc] init] convertStringToDate:newsObject[JSONDateProperty]];
    return [NSDate convertStringToDate:newsObject[JSONDateProperty]];
}

- (NSString *)getTitle:(NSDictionary *)newsObject {
    return (![newsObject[JSONTitleProperty] isKindOfClass:[NSNull class]]) ? newsObject[JSONTitleProperty] : emptyString;
}

- (NSString *)getDesr:(NSDictionary *)newsObject {
    return (![newsObject[JSONDescriptionProperty] isKindOfClass:[NSNull class]]) ? newsObject[JSONDescriptionProperty] : emptyString;
}

- (void)getUrlString {
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlAttributesFileName ofType:urlAttributesFileExtension]];
    
    NSString *address = [dict objectForKey:pListAddressPropertyName];
    NSString *countryCode = [dict objectForKey:pListCountryCodePropertyName];
    NSString *apiKey = [dict objectForKey:pListApiKeyPropertyName];
    
    self.urlString = [[NSString alloc] initWithFormat:urlStringFormat, address, countryCode, apiKey];
}

#pragma mark - <NewsDataSourceProtocol>

- (void)addObserver:(id<NewsDataObserverProtocol>)observer {
    [self.observers addPointer:(__bridge void * _Nullable)(observer)];
}

- (void)removeObserver:(id<NewsDataObserverProtocol>)observer {
    for (int index = 0; index < self.observers.count; ++index) {
        if ([self.observers pointerAtIndex:index] == (__bridge void * _Nullable)(observer)) {
            [self.observers removePointerAtIndex:index];
        }
    }
}

- (void)sendContextChange {
    for (id<NewsDataObserverProtocol> observer in self.observers) {
        [observer contextUpdated];
    }
}

- (NSUInteger)getNewsCount {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:newsEntityName];
    NSError *error = nil;
    NSUInteger newsCount = [self.managedObjectContext countForFetchRequest:fetchRequest error:&error];
    if (error == nil) {
        return newsCount;
    } else {
        NSLog(@"%@", error.localizedDescription);
        return 0;
    }
}

- (void)downloadNewsFromURL {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *data = [session dataTaskWithURL:[NSURL URLWithString:[self urlString]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil && data != nil) {
            NSError *errorJSONSerialization = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJSONSerialization];
            if (errorJSONSerialization == nil) {
                [self didDownloadData:json :^{
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        [self saveContextAndSendChange];
                    });
                }];
            } else {
                NSLog(@"Json serialization error - %@", errorJSONSerialization.localizedDescription);
            }
        } else {
            NSLog(@"Download error - %@", error.localizedDescription);
        }
    }];
    [data resume];
}

- (void)getAllNewsFromContext:(void(^)(NSArray<NewsModelProtocol> *fetched))completionHandler {
    // Setup fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:newsEntityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set sorting by date
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:dateName ascending:NO];
    [fetchRequest setSortDescriptors:[[NSArray alloc] initWithObjects:sortDescriptor, nil]];
    
    // Execute fetch request
    NSError *error = nil;
    NSArray<NewsModelProtocol> *fetchedObjects = (NSArray<NewsModelProtocol> *)[self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil && error != nil) {
        NSLog(@"error");
    } else {
        completionHandler(fetchedObjects);
    }
}
- (id<NewsModelProtocol>)getSingleNewsFromContextAtIndex:(NSUInteger)index {
    // Setup fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:newsEntityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set sorting by date
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:dateName ascending:NO];
    [fetchRequest setSortDescriptors:[[NSArray alloc] initWithObjects:sortDescriptor, nil]];
    
    // Execute fetch request
    NSError *error = nil;
    NSArray<NewsModelProtocol> *fetchedObjects = (NSArray<NewsModelProtocol> *)[self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil && error != nil) {
        NSLog(@"error");
        return nil;
    } else {
        return fetchedObjects[index];
    }
}
- (void)didDownloadData:(NSDictionary *)json
                       :(void(^)(void))completionHandler{
    
    for (NSDictionary *newsDict in json[JSONArticle]) {
        // Setup fetch request to check that newsDict is unique
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:newsEntityName];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == %@", [self getTitle:newsDict]];
        [fetchRequest setPredicate:predicate];
        NSError *error = nil;
        
        // Check that newsDict is unique
        if ([self.managedObjectContext countForFetchRequest:fetchRequest error:&error] == 0) {
            // If unique and no error - then add
            if (error == nil) {
                id<NewsModelProtocol> item = [NSEntityDescription insertNewObjectForEntityForName:newsEntityName inManagedObjectContext:self.managedObjectContext];
                item.date = [self getDate:newsDict];
                item.title = [self getTitle:newsDict];
                item.descr = [self getDesr:newsDict];
            } else {
                NSLog(@"Count of fetch request error - %@", error.localizedDescription);
            }
        }
    }
    completionHandler();
}

-(void)addSingleObjectToContext:(NSDate *)date
                         :(NSString *)title
                         :(NSString *)descr {
    id<NewsModelProtocol> item = [NSEntityDescription insertNewObjectForEntityForName:newsEntityName inManagedObjectContext:self.managedObjectContext];
    item.date = date;
    item.title = title;
    item.descr = descr;
    
    [self saveContextAndSendChange];
    
}

- (void)clearAllData {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:newsEntityName];
    NSBatchDeleteRequest *batchDeleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
    [self.managedObjectContext performBlockAndWait:^{
        NSError *childError = nil;
        [self.managedObjectContext executeRequest:batchDeleteRequest error:&childError];
        if (![self.managedObjectContext save:&childError]) {
            NSLog(@"Child context clear error");
        }
    }];
}

-(void)saveContext:(void(^)(void))completionHandler {
    [self.managedObjectContext performBlockAndWait:^{
        NSError *managedObjectContextError = nil;
        if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&managedObjectContextError]) {
            NSLog(@"Managed Object context save error");
        }
        completionHandler();
    }];
}

- (void)saveContextAndSendChange {
    [self saveContext:^{
        [self sendContextChange];
    }];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    //The directory the application uses to store the Core Data store file. This code uses a directory named "com.mindstick.CoreDataSample" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:newsDataModelName withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:newsDataModelName];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}
@end
