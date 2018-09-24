//
//  AFRootPresenter.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootPresenterProtocol.h"
#import "RootRouterProtocol.h"
#import "RootViewControllerProtocol.h"

@interface AFRootPresenter : NSObject <RootPresenterProtocol>
@property (nonatomic, strong) id<RootRouterProtocol> router;
@property (nonatomic, weak) id<RootViewControllerProtocol> view;

- (void)showCalculator;
- (void)showNews;
@end
