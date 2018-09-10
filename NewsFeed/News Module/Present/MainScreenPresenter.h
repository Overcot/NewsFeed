//
//  MainScreenNewsPresenter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainScreenPresentProtocol.h"
#import "MainScreenInteractProtocol.h"
#import "MainScreenViewProtocol.h"
@interface MainScreenPresenter : NSObject <MainScreenPresentProtocol>

@property (nonatomic, weak) id<MainScreenViewProtocol> view;
@property (nonatomic, strong) id<MainScreenInteractProtocol> interactor;

- (int) getNewsCount;
- (NSString *) presentDateAtIndex:(int)index;
- (NSString *) presentTitleAtIndex:(int)index;
- (NSString *) presentDescrAtIndex:(int)index;
- (id<NewsModelProtocol>) getNewsAtIndex:(int)index;

- (void) didFinishDownload;
- (void) errorDownloading;
- (void) refreshNews;

@end
