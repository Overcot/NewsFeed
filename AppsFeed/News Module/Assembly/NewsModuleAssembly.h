//
//  AFNewsModuleAssembly.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class NewsMainScreenViewController;
@class NewsMainScreenPresenter;
@class NewsMainScreenInteractor;
@class NewsMainScreenRouter;

@interface NewsModuleAssembly : TyphoonAssembly

- (NewsMainScreenViewController *)newsMainScreenViewController;
- (NewsMainScreenPresenter *)newsMainScreenPresenter;
- (NewsMainScreenInteractor *)newsMainScreenInteractor;
- (NewsMainScreenRouter *)newsMainScreenRouter;

@end
