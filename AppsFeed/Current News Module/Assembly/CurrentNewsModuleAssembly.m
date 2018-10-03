//
//  AFCurrentNewsModuleAssembly.m
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsModuleAssembly.h"
#import "CurrentNewsViewController.h"
#import "CurrentNewsPresenter.h"
#import "CurrentNewsInteractor.h"
#import "CurrentNewsRouter.h"
#import "NewsDataSourceAssembly.h"

@interface CurrentNewsModuleAssembly ()

@property (nonatomic, weak) TyphoonAssembly<NewsDataSourceAssembly> *newsDataSourceAssembly;


@end

@implementation CurrentNewsModuleAssembly

- (CurrentNewsViewController *)currentNewsViewController {
    return [TyphoonDefinition withClass:[CurrentNewsViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self currentNewsPresenter]];
    }];
}

- (CurrentNewsPresenter *)currentNewsPresenter {
    return [TyphoonDefinition withClass:[CurrentNewsPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(view) with:[self currentNewsViewController]];
        [definition injectProperty:@selector(interactor) with:[self currentNewsInteractor]];
        [definition injectProperty:@selector(router) with:[self currentNewsRouter]];
    }];
}

- (CurrentNewsInteractor *)currentNewsInteractor {
    return [TyphoonDefinition withClass:[CurrentNewsInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self currentNewsPresenter]];
        [definition useInitializer:@selector(initWithDataSource:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.newsDataSourceAssembly newsDataSource]];
        }];
    }];
}

- (CurrentNewsRouter *)currentNewsRouter {
    return [TyphoonDefinition withClass:[CurrentNewsRouter class]];
}

@end
