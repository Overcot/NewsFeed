//
//  MainScreenRouter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NewsMainScreenInteractor.h"
#import "NewsMainScreenPresenter.h"
#import "NewsMainScreenView.h"

@interface NewsMainScreenRouter : NSObject
@property (nonatomic, strong) id<NewsMainScreenPresenterProtocol> presenter;
@property (nonatomic, strong) id<NewsMainScreenViewProtocol> view;
@property (nonatomic, strong) id<NewsMainScreenInteractorProtocol> interactor;

@end
