//
//  NewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewsPreviewCell.h"
#import "NewsManager.h"
#import "CurrentNewsViewController.h"

@interface NewsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NewsModelDelegate>
@property (nonatomic, weak) IBOutlet UITableView *newsTableView;
@property (nonatomic, strong) NewsManager *newsManager;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void) didFinishDownload;


@end
