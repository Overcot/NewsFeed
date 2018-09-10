//
//  NewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewsPreviewCell.h"
#import "CurrentNewsView.h"
#import "CurrentNewsInteractor.h"
#import "CurrentNewsPresenter.h"
#import "CurrentNewsRouter.h"
#import "MainScreenPresenter.h"

@interface MainScreenView : UIViewController <UITableViewDataSource, UITableViewDelegate, MainScreenViewProtocol>
@property (nonatomic, weak) IBOutlet UITableView *newsTableView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) id <MainScreenPresentProtocol> presenter;

- (void) reloadData;
- (void) showError;
@end
