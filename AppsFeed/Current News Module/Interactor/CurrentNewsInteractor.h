//
//  CurrentNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModelProtocol.h"
#import "CurrentNewsInteractProtocol.h"
#import "CurrentNewsPresentProtocol.h"
#import "NewsDataSourceProtocol.h"
#import "NewsDataObserverProtocol.h"

@interface CurrentNewsInteractor : NSObject <CurrentNewsInteractProtocol, NewsDataObserverProtocol>

- (NSInteger) getAmountOfNews;
- (id<NewsModelProtocol>)getCellDataForIndexPath:(NSIndexPath *)indexPath;

@end
