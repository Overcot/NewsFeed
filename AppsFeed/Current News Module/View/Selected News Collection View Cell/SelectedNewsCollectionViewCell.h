//
//  SelectedNewsCollectionViewCell.h
//  AppsFeed
//
//  Created by User on 02.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModelProtocol.h"
@interface SelectedNewsCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) id<NewsModelProtocol> model;

@end
