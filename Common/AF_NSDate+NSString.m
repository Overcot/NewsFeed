//
//  NSDate+AFNSString.m
//  AppsFeed
//
//  Created by User on 01.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AF_NSDate+NSString.h"

@implementation NSDate (NSString)
static NSString *const dateFromFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
static NSString *const dateToFormat = @"HH:mm, dd-MM-yyyy";

static NSString *const fromAbbreviation = @"GMT";
static NSString *const toAbbreviation = @"Moscow";

- (NSDate *)convertStringToDate:(NSString*)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:fromAbbreviation]];
    [dateFormatter setDateFormat:dateFromFormat];
    NSDate *date = [dateFormatter dateFromString:dateString]; // create date from string
    return date;
}

@end
