//
//  AFCalculatorAssembly.m
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFCalculatorModuleAssembly.h"

@implementation AFCalculatorModuleAssembly

- (CalculatorScreenViewController *)calculatorViewController {
    return [TyphoonDefinition withClass:[CalculatorScreenViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self calculatorPresenter]];
    }];
}

- (CalculatorScreenPresenter *)calculatorPresenter {
    return [TyphoonDefinition withClass:[CalculatorScreenPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(view) with:[self calculatorViewController]];
        [definition injectProperty:@selector(router) with:[self calculatorRouter]];
        [definition injectProperty:@selector(interactor) with:[self calculatorInteractor]];
    }];
}

- (CalculatorScreenInteractor *)calculatorInteractor {
    return [TyphoonDefinition withClass:[CalculatorScreenInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self calculatorPresenter]];
    }];
}

- (CalculatorScreenRouter *)calculatorRouter {
    return [TyphoonDefinition withClass:[CalculatorScreenRouter class] configuration:^(TyphoonDefinition *definition) {
    }];
}



@end
