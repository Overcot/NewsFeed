//
//  NewsMainScreenConfigurator.m
//  NewsFeed
//
//  Created by User on 14.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenConfigurator.h"
#import "NewsMainScreenView.h"
#import "NewsMainScreenPresenter.h"
#import "NewsMainScreenInteractor.h"
#import "NewsMainScreenRouter.h"

@interface NewsMainScreenConfigurator ()
@property (nonatomic, strong) IBOutlet NewsMainScreenView *viewController;

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
    NewsMainScreenRouter *router = [[NewsMainScreenRouter alloc] init];
    
    //Configure
    router.fromViewController = self.viewController;
    self.viewController.presenter.view = self.viewController;
    self.viewController.presenter.interactor.presenter = self.viewController.presenter;
    self.viewController.presenter.router = router;
}

@end
