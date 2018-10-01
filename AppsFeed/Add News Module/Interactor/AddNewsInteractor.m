//
//  AddNewsInteractor.m
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsInteractor.h"
#import <CoreData/CoreData.h>
#import "AFAppDelegate.h"
#import "NewsComponents.h"
#import "NewsDataSourceProtocol.h"

@interface AddNewsInteractor ()
@property (nonatomic, strong) id<NewsDataSourceProtocol> dataSource;
@end


@implementation AddNewsInteractor
static NSString *const newsEntityName = @"News";


- (instancetype)init {
    self = [super init];
    if (self) {
        [self.dataSource addObserver:self];
    }
    return self;
}
- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr {
    
    
    [self.dataSource addObjectToContext:date :title :descr];
}
@end
