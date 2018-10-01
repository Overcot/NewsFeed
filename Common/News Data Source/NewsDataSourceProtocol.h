//
//  NewsDataSourceProtocol.h
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol NewsModelProtocol;
@class NSManagedObjectContext;
@protocol NewsDataSourceProtocol

- (void)addObserver:(id)observer;
- (NSArray<NewsModelProtocol> *)getNewsFromContext;
- (void)downloadNewsFromURL;
- (NSUInteger)getNewsCount;
- (void)addObjectToContext:(NSDate *)date
                          :(NSString *)title
                          :(NSString *)descr;

@end
