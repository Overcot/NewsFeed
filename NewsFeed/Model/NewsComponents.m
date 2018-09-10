//
//  NewsComponents.m
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsComponents.h"

@implementation NewsComponents
@synthesize date = _date;
@synthesize title = _title;
@synthesize descr = _descr;

- (instancetype) initWithDate:(NSString *)date
                        title:(NSString *)title
                  description:(NSString *)descr {
    self = [super init];
    if (self) {
        _date = date;
        _title = title;
        _descr = descr;
    }
    return self;
}


@end
