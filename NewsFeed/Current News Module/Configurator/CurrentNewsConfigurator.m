//
//  CurrentNewsConfigurator.m
//  NewsFeed
//
//  Created by User on 14.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsConfigurator.h"
#import "CurrentNewsView.h"
#import "CurrentNewsRouter.h"
#import "CurrentNewsPresenter.h"
#import "CurrentNewsInteractor.h"

@interface CurrentNewsConfigurator ()

@property (nonatomic, strong) IBOutlet CurrentNewsView *viewController;

@end


@implementation CurrentNewsConfigurator
static NSString *const storyBoardName = @"Main";

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Presenter
    self.viewController.presenter = [[CurrentNewsPresenter alloc] init];
    
    // Interface
    self.viewController.presenter.interactor = [[CurrentNewsInteractor alloc] init];
    
    // Router
    
    //Configure
    self.viewController.presenter.view = self.viewController;
    self.viewController.presenter.interactor.presenter = self.viewController.presenter;
    
}

@end
