//
//  CurrentNewsInteractor.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentNewsInteract.h"
#import "NewsModelProtocol.h"
#import "CurrentNewsPresent.h"
@interface CurrentNewsInteractor : NSObject <CurrentNewsInteract>

@property (nonatomic, strong) id<NewsModelProtocol> news;
@property (nonatomic, weak) id<CurrentNewsPresent> presenter;
- (NSString *) getDate;
- (NSString *) getTitle;
- (NSString *) getDescr;

@end
