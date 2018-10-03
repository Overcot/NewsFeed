//
//  NewsMainScreenRouterProtocol.h
//  NewsFeed
//
//  Created by User on 17.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol NewsMainScreenViewProtocol;
@protocol NewsModelProtocol;

@protocol NewsMainScreenRouterProtocol <NSObject>

- (void)showFromViewControllerWithObject:(UIViewController<NewsMainScreenViewProtocol>*)fromViewController
                                        :(id<NewsModelProtocol>)object
                                        :(NSInteger)index;
- (void)showAddNewsViewController:(UIViewController<NewsMainScreenViewProtocol>*)fromViewController;
@end
