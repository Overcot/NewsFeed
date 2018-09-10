//
//  NewsModel.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModelProtocol.h"
#import "NewsComponents.h"
#import "NewsModelDelegate.h"

@interface NewsManager : NSObject
@property (nonatomic, strong) NSArray <NewsModelProtocol> *newsList;
@property (nonatomic, strong) NSObject <NewsModelDelegate> *delegate;
@property (nonatomic, strong) NSString *urlString;

- (instancetype) init;
- (void) getUrlString;
- (id <NewsModelProtocol>) getNewsAtIndex:(NSInteger)index;
- (NSUInteger) getNewsCount;
- (void) refreshNews;
- (void) downloadNewsFromString:(NSString *)urlString;
- (NSString *) convertDate:(NSString*)dateString;

@end







