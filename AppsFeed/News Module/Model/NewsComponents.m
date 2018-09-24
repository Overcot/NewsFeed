//
//  NewsComponents.m
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsComponents.h"

@implementation NewsComponents

static NSString *const emptyString = @"";

@synthesize date = _date;
@synthesize title = _title;
@synthesize descr = _descr;

- (instancetype) initWithDate:(NSString *)date
                        title:(NSString *)title
                  description:(NSString *)descr {
    self = [super init];
    if (self) {
        _date = (![date isKindOfClass:[NSNull class]]) ? date : emptyString;
        _title = (![title isKindOfClass:[NSNull class]]) ? title : emptyString;
        _descr = (![descr isKindOfClass:[NSNull class]]) ? descr : emptyString;
    }
    return self;
}

@end
