//
//  CurrentNewsInteract.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModelProtocol.h"
@protocol CurrentNewsInteract <NSObject>
@required
@property (nonatomic, strong) id<NewsModelProtocol> news;
- (NSString *) getDate;
- (NSString *) getTitle;
- (NSString *) getDescr;

@end
