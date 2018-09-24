//
//  AFRootRouter.m
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFRootRouter.h"

@implementation AFRootRouter
static NSString *const storyBoardName = @"Main";

- (void)showCalculator {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController<CalculatorScreenViewProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CalculatorScreenViewController class])];
    [self.transitionHandler.navigationController pushViewController:view animated:YES];
}

- (void)showNews {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController<NewsMainScreenViewProtocol> * view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([NewsMainScreenViewController class])];
    [self.transitionHandler.navigationController pushViewController:view animated:YES];
}


@end
