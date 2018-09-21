//
//  AfApplicationAssembly.h
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import "CurrentNewsConfigurator.h"

@class AFAppDelegate;
@class AFRootViewController;
@class NewsMainScreenConfigurator;
@class CurrentNewsConfigurator;
@class CalculatorScreenViewController;

@interface AFApplicationAssembly : TyphoonAssembly

//@property(nonatomic, strong, readonly) PFCoreComponents *coreComponents;
//@property(nonatomic, strong, readonly) PFThemeAssembly *themeProvider;


- (AFAppDelegate *)appDelegate;

- (AFRootViewController *)rootViewController;

//- (CalculatorScreenViewController *) calculatorViewController;
@end
