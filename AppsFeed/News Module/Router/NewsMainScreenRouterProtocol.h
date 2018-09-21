//
//  NewsMainScreenRouterProtocol.h
//  NewsFeed
//
//  Created by User on 17.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsMainScreenViewProtocol.h"

@protocol NewsMainScreenViewProtocol;
@protocol NewsMainScreenRouterProtocol <NSObject>

- (void)showFromViewControllerWithObject:(UIViewController<NewsMainScreenViewProtocol>*) fromViewController
                                        :(id<NewsModelProtocol>)object;
@end
