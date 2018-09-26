//
//  AddNewsAssembly.h
//  AppsFeed
//
//  Created by User on 25.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "TyphoonAssembly.h"

@class AddNewsViewController;
@class AddNewsPresenter;
@class AddNewsInteractor;
@class AddNewsRouter;
@interface AddNewsModuleAssembly : TyphoonAssembly

- (AddNewsViewController *)addNewsViewController;
- (AddNewsPresenter *)addNewsPresenter;
- (AddNewsInteractor *)addNewsInteractor;
- (AddNewsRouter *)addNewsRouter;
@end
