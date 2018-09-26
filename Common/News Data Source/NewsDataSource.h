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
@property (nonatomic, strong) NSManagedObjectContext *childObjectContext;
- (NSArray<NewsModelProtocol> *)getNewsFromContext;
- (void)downloadNewsFromURL;
- (NSUInteger)getNewsCount;

@end
