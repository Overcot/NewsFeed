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
@synthesize router = _router;

#pragma mark - <NewsMainScreenPresenterProtocol>

- (id<NewsModelProtocol>) getNewsAtIndex:(int)index {
    return [self.interactor getNewsAtIndex:index];
}

#pragma mark - <NewsMainScreenViewProtocol>

- (void)didFinishDownload {
    [self.view reloadData];
}

- (void)errorDownloading{
    [self.view showError];
}

- (void) refreshNews {
    [self.interactor downloadNewsFromNetwork];
}

- (void) viewFinishedLoading {
    [self.interactor getSavedNews];
}

#pragma mark - Router

- (void)showFromViewControllerWithObject:(UIViewController<NewsMainScreenViewProtocol>*) fromViewController
                                        :(id<NewsModelProtocol>)object
                                        :(NSInteger)index {
    [self.router showFromViewControllerWithObject:fromViewController:object:index];
}

- (void)showAddNewsViewController:(UIViewController<NewsMainScreenViewProtocol>*)fromViewController {
    [self.router showAddNewsViewController:fromViewController];
}

#pragma mark - <UITableViewDataSource>

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.interactor tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.interactor tableView:tableView numberOfRowsInSection:section];
}

@end
