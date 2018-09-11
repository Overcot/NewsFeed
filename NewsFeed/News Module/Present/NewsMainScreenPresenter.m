//
//  MainScreenNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenPresenter.h"

@implementation NewsMainScreenPresenter
static NSString *const emptyString = @"";

@synthesize view = _view;
@synthesize interactor = _interactor;

- (int) getNewsCount {
    return [self.interactor getNewsCount];
}

- (NSString *)presentDateAtIndex:(int)index {
    NSString *date = [self.interactor getDateAtIndex:index];
    if (![date isKindOfClass:[NSNull class]]) {
        return date;
    } else {
        return emptyString;
    }
}

- (NSString *)presentDescrAtIndex:(int)index {
    NSString *descr = [self.interactor getDescrAtIndex:index];
    if (![descr isKindOfClass:[NSNull class]]) {
        return descr;
    } else {
        return emptyString;
    }
}

- (NSString *)presentTitleAtIndex:(int)index {
    NSString *title = [self.interactor getTitleAtIndex:index];
    if (![title isKindOfClass:[NSNull class]]) {
        return title;
    } else {
        return emptyString;
    }
}

- (id<NewsModelProtocol>) getNewsAtIndex:(int)index {
    return [self.interactor getNewsAtIndex:index];
}

- (void) refreshNews {
    [self.interactor refreshNews];
}

- (void) didFinishDownload {
    [self.view reloadData];
}

- (void) errorDownloading{
    [self.view showError];

}

- (void) viewFinishedLoading {
    [self.interactor refreshNews];
}
@end
