//
//  CurrentNewsInteractor.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsInteractor.h"

@implementation CurrentNewsInteractor

static NSString *const emptyString = @"";

@synthesize news = _news;

- (NSString *)getDate {
    if (![_news.date isKindOfClass:[NSNull class]]) {
        return _news.date;
    } else {
        return emptyString;
    }
}

- (NSString *)getDescr {
    if (![_news.descr isKindOfClass:[NSNull class]]) {
        return _news.descr;
    } else {
        return emptyString;
    }
}

- (NSString *)getTitle {
    if (![_news.title isKindOfClass:[NSNull class]]) {
        return _news.title;
    } else {
        return emptyString;
    }
}

@end
