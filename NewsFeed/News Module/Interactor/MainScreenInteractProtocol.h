//
//  MainScreenNewsInteractProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MainScreenPresentProtocol.h"
#import "NewsModelProtocol.h"

@protocol MainScreenInteractProtocol <NSObject>
@property (nonatomic, weak) id<MainScreenPresentProtocol> presenter;

- (NSString *) getDateAtIndex:(int)index;
- (NSString *) getTitleAtIndex:(int)index;
- (NSString *) getDescrAtIndex:(int)index;
- (id <NewsModelProtocol>) getNewsAtIndex:(NSInteger)index;
- (int) getNewsCount;
- (void) refreshNews;
@end
