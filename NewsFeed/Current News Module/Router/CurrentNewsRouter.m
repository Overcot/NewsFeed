//
//  CurrentNewsRouter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsRouter.h"

@implementation CurrentNewsRouter
static NSString *const storyBoardName = @"Main";

@synthesize presenter = _presenter;
@synthesize view = _view;
@synthesize interactor = _interactor;

- (instancetype) init{
    self = [super init];
    if (self) {
        _presenter = [[CurrentNewsPresenter alloc] init];
        UIStoryboard *sbt = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
        _view = [sbt instantiateViewControllerWithIdentifier:NSStringFromClass([CurrentNewsView class])];
        _interactor = [[CurrentNewsInteractor alloc] init];
        _presenter.view = _view;
        _presenter.interactor = _interactor;
        _interactor.presenter = _presenter;
        _view.presenter = _presenter;
    }
    return self;
}

@end
