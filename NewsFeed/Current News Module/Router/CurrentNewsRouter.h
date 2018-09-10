//
//  CurrentNewsRouter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "CurrentNewsView.h"
#import "CurrentNewsInteractor.h"
#import "CurrentNewsPresenter.h"

@interface CurrentNewsRouter : NSObject

@property (nonatomic, strong) CurrentNewsPresenter *presenter;
@property (nonatomic, strong) CurrentNewsView *view;
@property (nonatomic, strong) CurrentNewsInteractor *interactor;

@end
