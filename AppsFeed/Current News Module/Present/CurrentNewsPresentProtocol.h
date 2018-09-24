//
//  CurrentNewsPresent.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentNewsCellDataSource.h"

@protocol CurrentNewsCellDataSource;
@protocol CurrentNewsInteractProtocol;
@protocol CurrentNewsViewControllerProtocol;
@protocol CurrentNewsRouterProtocol;

@protocol CurrentNewsPresentProtocol <UITableViewDataSource, CurrentNewsCellDataSource>

@property (nonatomic, strong) id<CurrentNewsInteractProtocol> interactor;
@property (nonatomic, weak) id<CurrentNewsViewControllerProtocol> view;
@property (nonatomic, strong) id<CurrentNewsRouterProtocol> router;

- (void)addNews:(id<NewsModelProtocol>)news;


@end
