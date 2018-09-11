//
//  CurrentNewsInteract.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModelProtocol.h"
#import "CurrentNewsPresentProtocol.h"

@protocol CurrentNewsPresentProtocol;

@protocol CurrentNewsInteractProtocol <NSObject>
@property (nonatomic, strong) id<NewsModelProtocol> news;
@property (nonatomic, weak) id<CurrentNewsPresentProtocol> presenter;

- (NSString *) getDate;
- (NSString *) getTitle;
- (NSString *) getDescr;

@end
