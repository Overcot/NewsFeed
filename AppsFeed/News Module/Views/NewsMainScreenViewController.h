//
//  NewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsMainScreenViewProtocol.h"
#import "NewsPreviewCell.h"
@interface NewsMainScreenViewController : UIViewController <NewsMainScreenViewProtocol>

@property (nonatomic, strong) id <NewsMainScreenPresenterProtocol> presenter;

- (void) reloadData;
- (void) showError;

@end
