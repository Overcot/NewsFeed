//
//  AfApplicationAssembly.h
//  AppsFeed
//
//  Created by User on 21.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class RootViewController;
@class RootPresenter;
@class RootRouter;

@interface RootModuleAssembly : TyphoonAssembly

- (RootViewController *)rootViewController;
- (RootPresenter *)rootPresenter;
- (RootRouter *)rootRouter;

@end
