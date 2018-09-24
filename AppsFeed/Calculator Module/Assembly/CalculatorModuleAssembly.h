//
//  AFCalculatorAssembly.h
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class CalculatorScreenViewController;
@class CalculatorScreenPresenter;
@class CalculatorScreenInteractor;
@class CalculatorScreenRouter;

@interface CalculatorModuleAssembly : TyphoonAssembly

- (CalculatorScreenViewController *)calculatorViewController;
- (CalculatorScreenPresenter *)calculatorPresenter;
- (CalculatorScreenInteractor *)calculatorInteractor;
- (CalculatorScreenRouter *)calculatorRouter;

@end
