//
//  CurrentNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentNewsInteractProtocol.h"
#import "NewsModelProtocol.h"
#import "CurrentNewsPresentProtocol.h"
@interface CurrentNewsInteractor : NSObject <CurrentNewsInteractProtocol,CurrentNewsCellDataSource>

@property (nonatomic, strong) id<NewsModelProtocol> news;
@property (nonatomic, weak) id<CurrentNewsPresentProtocol, CurrentNewsCellDataSource> presenter;

- (NSString *) getCellDataForIndexPath:(NSIndexPath *)indexPath;
@end
