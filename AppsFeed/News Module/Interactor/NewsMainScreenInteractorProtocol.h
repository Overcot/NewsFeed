//
//  MainScreenNewsInteractProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol NewsModelProtocol;

@protocol NewsMainScreenInteractorProtocol <UITableViewDataSource>

- (id <NewsModelProtocol>)getNewsAtIndex:(NSInteger)index;
- (NSUInteger)getNewsCount;
- (void)refreshNews;

@end
