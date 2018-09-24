//
//  AFCurrentNewsModuleAssembly.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

#import "CurrentNewsViewController.h"
#import "CurrentNewsPresenter.h"
#import "CurrentNewsInteractor.h"
#import "CurrentNewsRouter.h"

@interface AFCurrentNewsModuleAssembly : TyphoonAssembly 

- (CurrentNewsViewController *)currentNewsViewController;
- (CurrentNewsPresenter *)currentNewsPresenter;
- (CurrentNewsInteractor *)currentNewsInteractor;
- (CurrentNewsRouter *)currentNewsRouter;

@end
