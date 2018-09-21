//
//  AFCalculatorAssembly.m
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFCalculatorAssembly.h"



@implementation AFCalculatorAssembly

- (CalculatorScreenViewController *)calculatorScreenViewController {
    return [TyphoonDefinition withClass:[CalculatorScreenViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(init)];
        
    }];
}


@end
