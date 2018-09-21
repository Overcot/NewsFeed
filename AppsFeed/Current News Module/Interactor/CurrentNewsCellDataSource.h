//
//  CurrentNewsCellDataProtocol.h
//  NewsFeed
//
//  Created by User on 18.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol CurrentNewsCellDataSource

- (NSString *) getCellDataForIndexPath:(NSIndexPath *)indexPath;

@end
