//
//  MainScreenRouter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenRouter.h"
#import "CurrentNewsViewController.h"

@implementation NewsMainScreenRouter
static NSString *const storyBoardName = @"Main";

- (void)showFromViewControllerWithObject:(UIViewController<NewsMainScreenViewProtocol>*) fromViewController
                                        :(id<NewsModelProtocol>) object {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UITableViewController<CurrentNewsViewControllerProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CurrentNewsViewController class])];
    [view addNews:object];
    [fromViewController.navigationController pushViewController:view animated:YES];
}

@end
