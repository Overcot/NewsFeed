//
//  AFCalculatorAssembly.h
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

#import "CalculatorScreenPresenter.h"
#import "CalculatorScreenViewController.h"
@class CalculatorScreenViewController;

@interface AFCalculatorAssembly : TyphoonAssembly

- (CalculatorScreenViewController *) calculatorScreenViewController;
@end
