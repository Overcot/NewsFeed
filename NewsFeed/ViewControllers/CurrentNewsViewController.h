//
//  CurrentNewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsManager.h"

@interface CurrentNewsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) id<NewsModelProtocol> news;
@property (nonatomic, weak) IBOutlet UITableView *newsTableView;

@end
