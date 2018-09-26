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

@property (nonatomic, strong) NSManagedObjectContext *childObjectContext;

- (NSArray<NewsModelProtocol> *)getNewsFromContext;
- (void)downloadNewsFromURL;
- (NSUInteger)getNewsCount;

@end
