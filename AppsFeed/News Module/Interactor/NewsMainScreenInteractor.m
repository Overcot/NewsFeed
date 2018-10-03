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

@synthesize presenter = _presenter;
@synthesize newsList = _newsList;
@synthesize dataSource = _dataSource;

- (instancetype)initWithDataSource:(id<NewsDataSourceProtocol>)dataSource {
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
        [self.dataSource addObserver:self];
    }
    return self;
}

#pragma mark - <NewsMainScreenInteractorProtocol>

- (id<NewsModelProtocol>)getNewsAtIndex:(NSInteger) index {
    return [self.dataSource getSingleNewsFromContextAtIndex:index];
}

- (void)downloadNewsFromNetwork {
    [self.dataSource downloadNewsFromURL];
}

- (void)getSavedNews {
    if ([self.dataSource getNewsCount] == 0) {
        [self downloadNewsFromNetwork];
    } else {
        [self.dataSource getAllNewsFromContext:^(NSArray<NewsModelProtocol> *fetched) {
            NSLog(@"All NewsFetched");
            self.newsList = fetched;
            [self.presenter didFinishDownload];
        }];
    }
}

#pragma mark - <NewsDataObserverProtocol>

- (void)contextUpdated {
    [self getSavedNews];
}

#pragma mark - <UITableViewDataSource>


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource getNewsCount];
}

@end
