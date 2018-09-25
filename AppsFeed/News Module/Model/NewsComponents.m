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

@dynamic date;
@dynamic title;
@dynamic descr;

- (instancetype) initWithDate:(NSDate *)date
                        title:(NSString *)title
                  description:(NSString *)descr {
    self = [super init];
    if (self) {
        self.date = (![date isKindOfClass:[NSNull class]]) ? date : [NSDate date];
        self.title = (![title isKindOfClass:[NSNull class]]) ? title : emptyString;
        self.descr = (![descr isKindOfClass:[NSNull class]]) ? descr : emptyString;
    }
    return self;
}

@end
