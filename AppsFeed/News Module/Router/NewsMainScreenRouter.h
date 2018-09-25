//
//  MainScreenRouter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsMainScreenRouterProtocol.h"

@protocol NewsMainScreenRouterProtocol;

@interface NewsMainScreenRouter : NSObject <NewsMainScreenRouterProtocol>

- (void)showFromViewControllerWithObject:(UIViewController<NewsMainScreenViewProtocol>*)fromViewController
                                        :(id<NewsModelProtocol>)object;
- (void)showAddNewsViewController:(UIViewController<NewsMainScreenViewProtocol>*)fromViewController;
@end
