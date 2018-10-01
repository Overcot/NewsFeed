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
    // need to correct implement this
   // [self.dataSource addObserver:self];

    self.newsList = [self.dataSource getNewsFromContext];
    if ([self.newsList count] == 0) {
        [self.dataSource downloadNewsFromURL];
    }
    [self.presenter didFinishDownload];
}

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
