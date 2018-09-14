//
//  MainScreenRouter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenRouter.h"

@implementation NewsMainScreenRouter
static NSString *const storyBoardName = @"Main";

- (void)showDetailViewControllerWithObject:(id<NewsModelProtocol>) object {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    CurrentNewsView *view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CurrentNewsView class])];
    view.presenter.interactor.news = object;
    [self.fromViewController.navigationController pushViewController:view animated:YES];
}


@end
