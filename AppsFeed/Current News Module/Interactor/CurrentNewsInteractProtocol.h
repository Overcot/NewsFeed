//
//  CurrentNewsInteract.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentNewsCellDataSource.h"

@protocol NewsModelProtocol;
@protocol CurrentNewsCellDataSource;

@protocol CurrentNewsInteractProtocol <UITableViewDataSource, CurrentNewsCellDataSource>
@property (nonatomic, strong) id<NewsModelProtocol> news;

- (void)addNews:(id<NewsModelProtocol>)news;

@end
