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
- (NSArray<NewsModelProtocol> *)getNewsFromContext;
- (void)downloadNewsFromURL;
- (NSUInteger)getNewsCount;
- (void)addObjectToContext:(NSDate *)date
                          :(NSString *)title
                          :(NSString *)descr;
- (void)addDictToContext:(NSDictionary *)newsObject;

@end
