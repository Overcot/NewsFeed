//
//  CurrentNewsInteractor.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsInteractor.h"

@implementation CurrentNewsInteractor

static NSString *const emptyString = @"";
static int const amountOfCells = 3;

@synthesize news = _news;

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return amountOfCells;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - <CurrentNewsCellDataSource>

- (NSString *) getCellDataForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return (![self.news.date isKindOfClass:[NSNull class]]) ? self.news.date : emptyString;
            break;
        case 1:
            return (![self.news.title isKindOfClass:[NSNull class]]) ? self.news.title : emptyString;
            break;
        case 2:
            return (![self.news.descr isKindOfClass:[NSNull class]]) ? self.news.descr : emptyString;
            break;
        default:
            return emptyString;
            break;
    }
}

@end