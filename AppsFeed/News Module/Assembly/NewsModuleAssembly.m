//
//  AFNewsModuleAssembly.m
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFNewsModuleAssembly.h"

@implementation AFNewsModuleAssembly

- (NewsMainScreenViewController *)newsMainScreenViewController {
    return [TyphoonDefinition withClass:[NewsMainScreenViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self newsMainScreenPresenter]];
    }];
}
- (NewsMainScreenPresenter *)newsMainScreenPresenter {
    return [TyphoonDefinition withClass:[NewsMainScreenPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(view) with:[self newsMainScreenViewController]];
        [definition injectProperty:@selector(interactor) with:[self newsMainScreenInteractor]];
        [definition injectProperty:@selector(router) with:[self newsMainScreenRouter]];
    }];
}

- (NewsMainScreenInteractor *)newsMainScreenInteractor {
    return [TyphoonDefinition withClass:[NewsMainScreenInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self newsMainScreenPresenter]];
    }];
}

- (NewsMainScreenRouter *)newsMainScreenRouter {
    return [TyphoonDefinition withClass:[NewsMainScreenRouter class]];
}

@end
