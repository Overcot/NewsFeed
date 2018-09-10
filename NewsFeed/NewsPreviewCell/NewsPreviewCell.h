//
//  NewsCell.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPreviewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *descrLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *separatorHeightConstaraint;

@end
