//
//  AddNewsAssembly.m
//  AppsFeed
//
//  Created by User on 25.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsModuleAssembly.h"
#import "AddNewsViewController.h"
#import "AddNewsPresenter.h"
#import "AddNewsInteractor.h"
#import "AddNewsRouter.h"
@implementation AddNewsModuleAssembly

- (AddNewsViewController *)addNewsViewController {
    return [TyphoonDefinition withClass:[AddNewsViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self addNewsPresenter]];
    }];
}

- (AddNewsPresenter *)addNewsPresenter {
    return [TyphoonDefinition withClass:[AddNewsPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self addNewsInteractor]];
        [definition injectProperty:@selector(router) with:[self addNewsRouter]];
    }];
}

- (AddNewsInteractor *)addNewsInteractor {
    return [TyphoonDefinition withClass:[AddNewsInteractor class] configuration:^(TyphoonDefinition *definition) {
        
    }];
}

- (AddNewsRouter *)addNewsRouter {
    return [TyphoonDefinition withClass:[AddNewsRouter class] configuration:^(TyphoonDefinition *definition) {
        
    }];
}

@end
