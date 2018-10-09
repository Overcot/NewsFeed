//
//  SelectedNewsCollectionViewCell.m
//  AppsFeed
//
//  Created by User on 02.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "SelectedNewsCollectionViewCell.h"
#import "AF_NSDate+NSString.h"

@interface SelectedNewsCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descrLabel;
@end

@implementation SelectedNewsCollectionViewCell
@synthesize model = _model;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(id<NewsModelProtocol>)model {
    _model = model;
    self.dateLabel.text = [NSDate convertDateToString:model.date];
    self.titleLabel.text = model.title;
    self.descrLabel.text = model.descr;
}


@end
