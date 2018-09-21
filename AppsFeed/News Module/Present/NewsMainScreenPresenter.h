//
//  MainScreenNewsPresenter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsMainScreenPresenterProtocol.h"
#import "NewsPreviewCell.h"

@protocol NewsMainScreenViewProtocol;
@protocol NewsMainScreenInteractorProtocol;
@protocol NewsMainScreenRouterProtocol;

@interface NewsMainScreenPresenter : NSObject <NewsMainScreenPresenterProtocol>

@property (nonatomic, weak) id<NewsMainScreenViewProtocol> view;
@property (nonatomic, strong) id<NewsMainScreenInteractorProtocol> interactor;
@property (nonatomic, strong) id<NewsMainScreenRouterProtocol> router;

- (id<NewsModelProtocol>) getNewsAtIndex:(int)index;

- (void) didFinishDownload;
- (void) errorDownloading;
- (void) refreshNews;
- (void) viewFinishedLoading;

@end
