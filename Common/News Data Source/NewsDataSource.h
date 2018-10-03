//
//  NewsDataSource.h
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDataSourceProtocol.h"
#import "NewsModelProtocol.h"

@interface NewsDataSource : NSObject <NewsDataSourceProtocol>

- (void)addObserver:(id)observer;
- (void)getAllNewsFromContext:(void(^)(NSArray<NewsModelProtocol> *fetched))completionHandler;
- (id<NewsModelProtocol>)getSingleNewsFromContextAtIndex:(NSUInteger)index;
- (void)downloadNewsFromURL;
- (NSUInteger)getNewsCount;
- (void)addSingleObjectToContext:(NSDate *)date
                          :(NSString *)title
                          :(NSString *)descr;

@end
