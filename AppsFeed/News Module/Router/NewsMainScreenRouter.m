//
//  MainScreenRouter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenRouter.h"
#import "CurrentNewsViewController.h"
#import "AddNewsViewController.h"

@implementation NewsMainScreenRouter
static NSString *const storyBoardName = @"Main";

- (void)showFromViewControllerWithObject:(UIViewController<NewsMainScreenViewProtocol>*) fromViewController
                                        :(id<NewsModelProtocol>) object
                                        :(NSInteger)index {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController<CurrentNewsViewControllerProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CurrentNewsViewController class])];
    view.indexOfSelectedNews = index;
    [fromViewController.navigationController pushViewController:view animated:YES];
}

- (void)showAddNewsViewController:(UIViewController<NewsMainScreenViewProtocol>*)fromViewController {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController<AddNewsViewControllerProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddNewsViewController class])];
    [fromViewController.navigationController pushViewController:view animated:YES];
}

@end
