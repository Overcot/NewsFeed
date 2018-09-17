//
//  MainScreenNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenPresenter.h"

@implementation NewsMainScreenPresenter
static NSString *const emptyString = @"";

@synthesize view = _view;
@synthesize interactor = _interactor;

#pragma mark - <NewsMainScreenPresenterProtocol>

- (NSString *)presentDateAtIndex:(int)index {
    NSString *date = [self.interactor getDateAtIndex:index];
    if (![date isKindOfClass:[NSNull class]]) {
        return date;
    } else {
        return emptyString;
    }
}

- (NSString *)presentDescrAtIndex:(int)index {
    NSString *descr = [self.interactor getDescrAtIndex:index];
    if (![descr isKindOfClass:[NSNull class]]) {
        return descr;
    } else {
        return emptyString;
    }
}

- (NSString *)presentTitleAtIndex:(int)index {
    NSString *title = [self.interactor getTitleAtIndex:index];
    if (![title isKindOfClass:[NSNull class]]) {
        return title;
    } else {
        return emptyString;
    }
}

- (id<NewsModelProtocol>) getNewsAtIndex:(int)index {
    return [self.interactor getNewsAtIndex:index];
}

- (void) refreshNews {
    [self.interactor refreshNews];
}

- (void) viewFinishedLoading {
    [self.interactor refreshNews];
}

#pragma mark - <NewsMainScreenViewProtocol>

- (void) didFinishDownload {
    [self.view reloadData];
}

- (void) errorDownloading{
    [self.view showError];
}

#pragma mark - <UITableViewDataSource>

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellIdentifier = NSStringFromClass([NewsPreviewCell class]);
    NewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.dateLabel.text = [self presentDateAtIndex:(int)indexPath.row];
    cell.titleLabel.text = [self presentTitleAtIndex:(int)indexPath.row];
    cell.descrLabel.text = [self presentDescrAtIndex:(int)indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.interactor getNewsCount];
}

@end
