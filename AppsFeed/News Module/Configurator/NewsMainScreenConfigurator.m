//
//  NewsMainScreenConfigurator.m
//  NewsFeed
//
//  Created by User on 14.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenConfigurator.h"

@interface NewsMainScreenConfigurator ()
@property (nonatomic, strong) IBOutlet NewsMainScreenViewController *viewController;

@end

@implementation NewsMainScreenConfigurator
static NSString *const storyBoardName = @"Main";

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Presenter
    self.viewController.presenter = [[NewsMainScreenPresenter alloc] init];
    
    // Interface
    self.viewController.presenter.interactor = [[NewsMainScreenInteractor alloc] init];
    
    // Router
    id<NewsMainScreenRouterProtocol> router = [[NewsMainScreenRouter alloc] init];
    
    //Configure
    self.viewController.presenter.view = self.viewController;
    self.viewController.presenter.interactor.presenter = self.viewController.presenter;
    self.viewController.presenter.router = router;
}

@end
