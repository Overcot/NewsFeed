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
@property (nonatomic, weak) id<AddNewsPresenterProtocol> presenter;
@end


@implementation AddNewsInteractor
static NSString *const newsEntityName = @"News";

- (instancetype)initWithDataSource:(id<NewsDataSourceProtocol>)dataSource {
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
        [dataSource addObserver:self];
    }
    return self;
}
- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr {
    [self.dataSource addSingleObjectToContext:date :title :descr];
}

- (void)contextUpdated {
    NSLog(@"News Saved");
    [self.presenter goBackToNewsMainScreen];

}

@end
