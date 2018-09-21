//
//  MainScreenNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsMainScreenInteractorProtocol.h"
#import "NewsMainScreenConfigurator.h"
#import "NewsComponents.h"

@interface NewsMainScreenInteractor : NSObject <NewsMainScreenInteractorProtocol>
@property (nonatomic, weak) id<NewsMainScreenPresenterProtocol> presenter;

- (id <NewsModelProtocol>) getNewsAtIndex:(NSInteger)index;
- (NSUInteger) getNewsCount;
- (void) refreshNews;

- (void) getUrlString;
- (void) downloadNewsFromString:(NSString *)urlString;
- (NSString *) convertDate:(NSString*)dateString;

@end
