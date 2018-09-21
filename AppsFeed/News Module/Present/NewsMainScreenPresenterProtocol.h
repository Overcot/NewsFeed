//
//  MainScreenNewsPresentProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NewsMainScreenViewProtocol.h"
#import "NewsMainScreenInteractorProtocol.h"
#import "NewsModelProtocol.h"
#import "NewsMainScreenRouterProtocol.h"

@protocol NewsMainScreenViewProtocol;
@protocol NewsMainScreenInteractorProtocol;
@protocol NewsMainScreenRouterProtocol;

@protocol NewsMainScreenPresenterProtocol <NSObject, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) id<NewsMainScreenViewProtocol> view;
@property (nonatomic, strong) id<NewsMainScreenInteractorProtocol> interactor;
@property (nonatomic, strong) id<NewsMainScreenRouterProtocol> router;

- (id<NewsModelProtocol>) getNewsAtIndex:(int)index;

- (void) didFinishDownload;
- (void) errorDownloading;
- (void) refreshNews;
- (void) viewFinishedLoading;

@end
