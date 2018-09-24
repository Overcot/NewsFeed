//
//  AfApplicationAssembly.m
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "RootModuleAssembly.h"
#import "RootViewController.h"
#import "RootPresenter.h"
#import "RootRouter.h"

@implementation RootModuleAssembly

- (RootViewController *)rootViewController {
    return [TyphoonDefinition withClass:[RootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self rootPresenter]];
    }];
}

- (RootPresenter *)rootPresenter {
    return [TyphoonDefinition withClass:[RootPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(view) with:[self rootViewController]];
        [definition injectProperty:@selector(router) with:[self rootRouter]];
    }];
}

- (RootRouter *)rootRouter {
    return [TyphoonDefinition withClass:[RootRouter class]];
}

@end
