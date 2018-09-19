//
//  CurrentNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsPresenter.h"

@implementation CurrentNewsPresenter
static NSString *const emptyString = @"";
@synthesize interactor = _interactor;
@synthesize view = _view;

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.interactor tableView:tableView numberOfRowsInSection:section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.interactor tableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - <CurrentNewsPresentProtocol>
- (NSString *) getCellDataForIndexPath:(NSIndexPath *)indexPath {
    return [self.interactor getCellDataForIndexPath:indexPath];
}

@end
