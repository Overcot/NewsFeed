//
//  CurrentNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsPresenter.h"

@implementation CurrentNewsPresenter

@synthesize interactor = _interactor;
@synthesize view = _view;

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.interactor tableView:tableView numberOfRowsInSection:section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.interactor tableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - <CurrentNewsCellDataSource>

- (NSString *)getCellDataForIndexPath:(NSIndexPath *)indexPath {
    return [self.interactor getCellDataForIndexPath:indexPath];
}

#pragma mark - <CurrentNewsPresentProtocol>

- (void)addNews:(id<NewsModelProtocol>)news {
    [self.interactor addNews:news];
}

@end
