//
//  CurrentNewsInteractor.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsInteractor.h"

@interface CurrentNewsInteractor ()

@property (nonatomic, weak) id<CurrentNewsPresentProtocol> presenter;
@property (nonatomic, strong) id<NewsDataSourceProtocol> dataSource;
@end


@implementation CurrentNewsInteractor

static NSString *const emptyString = @"";
static int const amountOfCells = 3;

static NSString *const dateToFormat = @"HH:mm, dd-MM-yyyy";
static NSString *const toAbbreviation = @"Moscow";

- (instancetype)initWithDataSource:(id<NewsDataSourceProtocol>)dataSource
{
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
        [self.dataSource addObserver:self];
    }
    return self;
}

#pragma mark - <CurrentNewsCellDataSource>

- (id<NewsModelProtocol>)getCellDataForIndexPath:(NSIndexPath *)indexPath {
    
    return [self.dataSource getSingleNewsFromContextAtIndex:indexPath.section];    
}

#pragma mark - <CurrentNewsInteractProtocol>
- (NSInteger) getAmountOfNews {
    return [self.dataSource getNewsCount];
}

- (NSString *)convertDateToString:(NSDate *)date{
    // create dateFormatter with UTC time format
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // change to a readable time format and change to local time zone
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:toAbbreviation]];
    [dateFormatter setDateFormat:dateToFormat];
    return [dateFormatter stringFromDate:date];
}
- (void)contextUpdated {
    
}

@end
