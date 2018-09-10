//
//  MainScreenRouter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainScreenInteractor.h"
#import "MainScreenPresenter.h"
#import "MainScreenView.h"

@interface MainScreenRouter : NSObject
@property (nonatomic, strong) id<MainScreenPresentProtocol> presenter;
@property (nonatomic, strong) MainScreenView *view;
@property (nonatomic, strong) id<MainScreenInteractProtocol> interactor;

@end
