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
#import "NewsDataSource.h"

@interface NewsMainScreenInteractor ()

@property (nonatomic, strong) id<NewsDataSourceProtocol> dataSource;
@property (nonatomic, weak) id<NewsMainScreenPresenterProtocol> presenter;
@property (nonatomic, strong) NSArray <NewsModelProtocol> *newsList;


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
@synthesize dataSource = _dataSource;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [[NewsDataSource alloc] init];

         [[NSNotificationCenter defaultCenter] addObserver:self
                                                  selector:@selector(updateNews:)
                                                      name:NSManagedObjectContextDidSaveNotification
                                                    object:self.dataSource.childObjectContext.parentContext];
    }
    return self;
}

-(void) updateNews:(NSNotification*)notification {
    [self getSavedNews];
}


#pragma mark - <NewsMainScreenInteractorProtocol>

- (id<NewsModelProtocol>)getNewsAtIndex:(NSInteger) index {
    id<NewsModelProtocol> element = [self.dataSource getNewsFromContext][index];
    return element;
}



- (void)refreshNews {
    [self.dataSource downloadNewsFromURL];
}

- (void)getSavedNews {
    self.newsList = [self.dataSource getNewsFromContext];
    if ([self.newsList count] == 0) {
        [self.dataSource downloadNewsFromURL];
    }
    [self.presenter didFinishDownload];
}

#pragma mark - <UITableViewDataSource>


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource getNewsCount];
}


@end
