//
//  MainScreenRouter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrentNewsView.h"
#import "NewsMainScreenRouterProtocol.h"

@interface NewsMainScreenRouter : NSObject <NewsMainScreenRouterProtocol>

@property (nonatomic, weak) UIViewController* fromViewController;

- (void)showDetailViewControllerWithObject:(id<NewsModelProtocol>)object;

@end
