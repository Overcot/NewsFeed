//
//  AddNewsPresenter.m
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsPresenter.h"

@implementation AddNewsPresenter

- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr {
    [self.interactor saveNews:date :title :descr];
}

@end
