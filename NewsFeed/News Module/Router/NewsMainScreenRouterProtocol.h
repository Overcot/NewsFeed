//
//  NewsMainScreenRouterProtocol.h
//  NewsFeed
//
//  Created by User on 14.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsMainScreenRouterProtocol

- (void)showDetailViewControllerWithObject:(id<NewsModelProtocol>)object;

@end


