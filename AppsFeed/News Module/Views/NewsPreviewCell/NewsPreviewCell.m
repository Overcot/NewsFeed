//
//  NewsCell.m
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsPreviewCell.h"

@implementation NewsPreviewCell

static NSString *const dateToFormat = @"HH:mm, dd-MM-yyyy";

static NSString *const toAbbreviation = @"Moscow";

@synthesize dateLabel = _dateLabel;
@synthesize titleLabel = _titleLabel;
@synthesize descrLabel = _descrLabel;
@synthesize separatorHeightConstaraint = _separatorHeightConstaraint;
@synthesize model = _model;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _separatorHeightConstaraint.constant = (1.0 / [UIScreen mainScreen].scale);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(id<NewsModelProtocol>)model {
    _model = model;
    _dateLabel.text = [self convertDateToString:model.date];
    _titleLabel.text = model.title;
    _descrLabel.text = model.descr;
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
