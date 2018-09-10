//
//  CurrentNewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentNewsPresent.h"

@interface CurrentNewsView : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *newsTableView;
@property (nonatomic, strong) id<CurrentNewsPresent> presenter;

@end
