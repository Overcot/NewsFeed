//
//  MainScreenNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsMainScreenInteractorProtocol.h"
#import "NewsModelProtocol.h"
#import "NewsComponents.h"

@interface NewsMainScreenInteractor : NSObject <NewsMainScreenInteractorProtocol>
@property (nonatomic, weak) id<NewsMainScreenPresenterProtocol> presenter;

@property (nonatomic, strong) NSArray <NewsModelProtocol> *newsList;

- (instancetype) init;
- (void) getUrlString;
- (id <NewsModelProtocol>) getNewsAtIndex:(NSInteger)index;
- (int) getNewsCount;
- (void) refreshNews;
- (void) downloadNewsFromString:(NSString *)urlString;
- (NSString *) convertDate:(NSString*)dateString;

- (NSString *) getDateAtIndex:(int)index;
- (NSString *) getTitleAtIndex:(int)index;
- (NSString *) getDescrAtIndex:(int)index;
@end
