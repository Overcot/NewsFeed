//
//  CurrentNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsPresenter.h"

@interface CurrentNewsPresenter ()

@end

@implementation CurrentNewsPresenter


#pragma mark - <CurrentNewsCellDataSource>

- (id<NewsModelProtocol>)getCellDataForIndexPath:(NSIndexPath *)indexPath {
    return [self.interactor getCellDataForIndexPath:indexPath];
}

#pragma mark - <CurrentNewsPresentProtocol>


- (NSInteger)getAmountOfSections {
    return [self.interactor getAmountOfNews];
}



@end
