//
//  AFRootRouterProtocol.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//


@class UIViewController;
@protocol RootViewControllerProtocol;

@protocol RootRouterProtocol <NSObject>

- (void)showCalculator:(UIViewController<RootViewControllerProtocol> *)fromViewController;
- (void)showNews:(UIViewController<RootViewControllerProtocol> *)fromViewController;

@end
