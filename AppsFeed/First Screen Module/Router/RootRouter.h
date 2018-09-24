//
//  AFRootRouter.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RootRouterProtocol.h"
#import "RootViewControllerProtocol.h"

@interface RootRouter : NSObject <RootRouterProtocol>

- (void)showCalculator:(UIViewController<RootViewControllerProtocol> *)fromViewController;
- (void)showNews:(UIViewController<RootViewControllerProtocol> *)fromViewController;


@end
