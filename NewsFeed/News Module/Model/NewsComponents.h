//
//  NewsComponents.h
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModelProtocol.h"

@interface NewsComponents : NSObject <NewsModelProtocol>
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descr;

- (instancetype) initWithDate:(NSString *) date
                         title:(NSString *) title
                   description:(NSString *) descr;

@end
