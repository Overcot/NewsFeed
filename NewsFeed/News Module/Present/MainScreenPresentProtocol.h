//
//  MainScreenNewsPresentProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainScreenViewProtocol.h"
#import "MainScreenInteractProtocol.h"
#import "NewsModelProtocol.h"
@protocol MainScreenViewProtocol;
@protocol MainScreenInteractProtocol;


@protocol MainScreenPresentProtocol <NSObject>
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
