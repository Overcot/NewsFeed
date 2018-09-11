//
//  CalculatorScreenRouter.m
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorScreenRouter.h"

@implementation CalculatorScreenRouter

static NSString *const storyBoardName = @"Main";

@synthesize view = _view;
@synthesize presenter = _presenter;
@synthesize interactor = _interactor;

- (instancetype) init {
    self = [super init];
    if (self) {
        _presenter = [[CalculatorScreenPresenter alloc] init];
        _interactor = [[CalculatorScreenInteractor alloc] init];
        UIStoryboard *sbt = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
        _view = [sbt instantiateViewControllerWithIdentifier:NSStringFromClass([CalculatorScreenView class])];
        _presenter.view = _view;
        _presenter.interactor = _interactor;
        _interactor.presenter = _presenter;
        _view.presenter = _presenter;
    }
    return self;
}

@end
