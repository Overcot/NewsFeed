//
//  CurrentNewsInteract.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CurrentNewsInteractProtocol

- (NSInteger) getAmountOfNews;
- (id<NewsModelProtocol>)getCellDataForIndexPath:(NSIndexPath *)indexPath;

@end
