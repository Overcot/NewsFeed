//
//  CalculatorConfigurator.m
//  NewsFeed
//
//  Created by User on 14.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorConfigurator.h"
#import "CalculatorScreenView.h"
#import "CalculatorScreenPresenter.h"
#import "CalculatorScreenInteractor.h"
#import "CalculatorScreenRouter.h"

@interface CalculatorScreenConfigurator()
@property (nonatomic, strong) IBOutlet CalculatorScreenView *viewController;

@end


@implementation CalculatorScreenConfigurator
static NSString *const storyBoardName = @"Main";

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Presenter
    self.viewController.presenter = [[CalculatorScreenPresenter alloc] init];
    
    // Interface
    self.viewController.presenter.interactor = [[CalculatorScreenInteractor alloc] init];
    
    // Router
    
    //Configure
    self.viewController.presenter.view = self.viewController;
    self.viewController.presenter.interactor.presenter = self.viewController.presenter;
    
}

@end
