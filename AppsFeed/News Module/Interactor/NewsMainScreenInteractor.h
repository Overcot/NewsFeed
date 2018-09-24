//
//  MainScreenNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NewsMainScreenInteractorProtocol.h"
#import "NewsMainScreenPresenterProtocol.h"
#import "NewsModelProtocol.h"

@interface NewsMainScreenInteractor : NSObject <NewsMainScreenInteractorProtocol>

- (id <NewsModelProtocol>)getNewsAtIndex:(NSInteger)index;
- (NSUInteger)getNewsCount;
- (void)refreshNews;

- (void)getUrlString;
- (void)downloadNewsFromString:(NSString *)urlString;
- (NSString *)convertDate:(NSString*)dateString;

@end
