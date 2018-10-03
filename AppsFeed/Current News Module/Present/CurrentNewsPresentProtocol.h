//
//  CurrentNewsPresent.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CurrentNewsPresentProtocol

- (NSInteger)getAmountOfSections;
- (id<NewsModelProtocol>)getCellDataForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)getIndexOfSelectedNews;
@end
