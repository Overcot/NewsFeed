//
//  AFCurrentNewsModuleAssembly.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class CurrentNewsViewController;
@class CurrentNewsPresenter;
@class CurrentNewsInteractor;
@class CurrentNewsRouter;

@interface CurrentNewsModuleAssembly : TyphoonAssembly 

- (CurrentNewsViewController *)currentNewsViewController;
- (CurrentNewsPresenter *)currentNewsPresenter;
- (CurrentNewsInteractor *)currentNewsInteractor;
- (CurrentNewsRouter *)currentNewsRouter;

@end
