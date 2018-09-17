//
//  MainScreenNewsInteractProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NewsMainScreenPresenterProtocol.h"
#import "NewsModelProtocol.h"

@protocol NewsMainScreenPresenterProtocol;

@protocol NewsMainScreenInteractorProtocol <NSObject>
@property (nonatomic, weak) id<NewsMainScreenPresenterProtocol> presenter;

- (NSString *) getDateAtIndex:(int)index;
- (NSString *) getTitleAtIndex:(int)index;
- (NSString *) getDescrAtIndex:(int)index;
- (id <NewsModelProtocol>) getNewsAtIndex:(NSInteger)index;
- (NSUInteger) getNewsCount;
- (void) refreshNews;

@end
