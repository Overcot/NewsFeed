//
//  AfApplicationAssembly.m
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFFirstScreenModuleAssembly.h"

#import "AFRootViewController.h"
#import "AFRootPresenter.h"
#import "AFRootRouter.h"

@implementation AFFirstScreenModuleAssembly

- (AFRootViewController *)rootViewController {
    return [TyphoonDefinition withClass:[AFRootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self rootPresenter]];
    }];
}

- (AFRootPresenter *)rootPresenter {
    return [TyphoonDefinition withClass:[AFRootPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(view) with:[self rootViewController]];
        [definition injectProperty:@selector(router) with:[self rootRouter]];
    }];
}

- (AFRootRouter *)rootRouter {
    return [TyphoonDefinition withClass:[AFRootRouter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(transitionHandler) with:[self rootViewController]];
    }];
}

@end
