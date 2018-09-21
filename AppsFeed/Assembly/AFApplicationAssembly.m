//
//  AfApplicationAssembly.m
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFApplicationAssembly.h"
#import "AFAppDelegate.h"
#import "AFCalculatorAssembly.h"


@implementation AFApplicationAssembly

- (AFAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AFAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:[self mainWindow]];
        [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
    }];
}

- (UIWindow *) mainWindow {
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
        [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
    }];
}

- (AFRootViewController *) rootViewController {
    return [TyphoonDefinition withClass:[AFRootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithAssembly:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[AFCalculatorAssembly class] ];
        }];
        definition.scope = TyphoonScopeSingleton;
    }];
}
/*
- (CalculatorScreenViewController *) calculatorViewController {
    return [TyphoonDefinition withClass:[CalculatorScreenViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(init)];
    }];
}*/
@end
