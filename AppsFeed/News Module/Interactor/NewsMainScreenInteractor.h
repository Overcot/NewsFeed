//
//  MainScreenNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NewsMainScreenInteractorProtocol.h"
#import "NewsMainScreenPresenterProtocol.h"
#import "NewsModelProtocol.h"
#import "NewsDataObserverProtocol.h"

@interface NewsMainScreenInteractor : NSObject <NewsMainScreenInteractorProtocol, NewsDataObserverProtocol>

- (id <NewsModelProtocol>)getNewsAtIndex:(NSInteger)index;
- (void)downloadNewsFromNetwork;
- (void)getSavedNews;

@end
