//
//  AFRootPresenter.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootPresenterProtocol.h"
#import "RootViewControllerProtocol.h"
#import "RootRouterProtocol.h"

@protocol RootRouterProtocol;
@protocol RootViewControllerProtocol;

@interface RootPresenter : NSObject <RootPresenterProtocol>

@property (nonatomic, strong) id<RootRouterProtocol> router;
@property (nonatomic, weak) UIViewController<RootViewControllerProtocol>* view;

- (void)showCalculator;
- (void)showNews;

@end
