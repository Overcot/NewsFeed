//
//  MainScreenNewsPresentProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsMainScreenViewProtocol.h"
#import "NewsMainScreenInteractorProtocol.h"
#import "NewsModelProtocol.h"

@protocol NewssMainScreenViewProtocol;
@protocol NewsMainScreenInteractorProtocol;

@protocol NewsMainScreenPresenterProtocol <NSObject>
@property (nonatomic, weak) id<NewsMainScreenViewProtocol> view;
@property (nonatomic, strong) id<NewsMainScreenInteractorProtocol> interactor;

- (int) getNewsCount;
- (NSString *) presentDateAtIndex:(int)index;
- (NSString *) presentTitleAtIndex:(int)index;
- (NSString *) presentDescrAtIndex:(int)index;
- (id<NewsModelProtocol>) getNewsAtIndex:(int)index;

- (void) didFinishDownload;
- (void) errorDownloading;
- (void) refreshNews;
- (void) viewFinishedLoading;

@end
