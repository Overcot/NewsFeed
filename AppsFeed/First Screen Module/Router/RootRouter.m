//
//  AFRootRouter.m
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "RootRouter.h"
#import "CalculatorScreenViewController.h"
#import "NewsMainScreenViewController.h"

@implementation RootRouter

static NSString *const storyBoardName = @"Main";

- (void)showCalculator:(UIViewController *)fromViewController {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController<CalculatorScreenViewProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CalculatorScreenViewController class])];
    [fromViewController.navigationController pushViewController:view animated:YES];
}

- (void)showNews:(UIViewController *)fromViewController {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController<NewsMainScreenViewProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([NewsMainScreenViewController class])];
    [fromViewController.navigationController pushViewController:view animated:YES];
}


@end
