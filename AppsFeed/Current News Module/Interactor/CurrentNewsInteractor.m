//
//  CurrentNewsInteractor.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsInteractor.h"

@interface CurrentNewsInteractor ()

@property (nonatomic, weak, readonly) id<CurrentNewsPresentProtocol> presenter;

@end


@implementation CurrentNewsInteractor

static NSString *const emptyString = @"";
static int const amountOfCells = 3;

static NSString *const dateToFormat = @"HH:mm, dd-MM-yyyy";
static NSString *const toAbbreviation = @"Moscow";

@synthesize news = _news;

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return amountOfCells;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - <CurrentNewsCellDataSource>

- (NSString *)getCellDataForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return (![self.news.date isKindOfClass:[NSNull class]]) ? [self convertDateToString:self.news.date] : emptyString;
            break;
        case 1:
            return (![self.news.title isKindOfClass:[NSNull class]]) ? self.news.title : emptyString;
            break;
        case 2:
            return (![self.news.descr isKindOfClass:[NSNull class]]) ? self.news.descr : emptyString;
            break;
        default:
            return emptyString;
            break;
    }
}

#pragma mark - <CurrentNewsInteractProtocol>

- (void)addNews:(id<NewsModelProtocol>)news {
    self.news = news;
}

- (NSString *)convertDateToString:(NSDate *)date{
    // create dateFormatter with UTC time format
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // change to a readable time format and change to local time zone
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:toAbbreviation]];
    [dateFormatter setDateFormat:dateToFormat];
    return [dateFormatter stringFromDate:date];
}
@end
