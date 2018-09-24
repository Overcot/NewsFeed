//
//  AFRootPresenter.m
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "RootPresenter.h"

@implementation RootPresenter

- (void)showCalculator {
    [self.router showCalculator:self.view];
}

- (void)showNews {
    [self.router showNews:self.view];
}

@end
