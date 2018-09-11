//
//  CalculatorScreenRouter.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorScreenView.h"
#import "CalculatorScreenPresenter.h"
#import "CalculatorScreenInteractor.h"

@interface CalculatorScreenRouter : NSObject
@property (nonatomic, strong) id<CalculatorScreenViewProtocol> view;
@property (nonatomic, strong) id<CalculatorScreenPresenterProtocol> presenter;
@property (nonatomic, strong) id<CalculatorScreenInteractorProtocol> interactor;

@end
