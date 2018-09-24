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

@interface CurrentNewsInteractor : NSObject <CurrentNewsInteractProtocol>

@property (nonatomic, strong) id<NewsModelProtocol> news;

- (NSString *)getCellDataForIndexPath:(NSIndexPath *)indexPath;
- (void)addNews:(id<NewsModelProtocol>)news;

@end
