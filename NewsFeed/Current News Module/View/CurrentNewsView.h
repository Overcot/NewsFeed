//
//  CurrentNewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentNewsViewProtocol.h"
#import "CurrentNewsPresentProtocol.h"

@interface CurrentNewsView : UIViewController <UITableViewDelegate, UITableViewDataSource, CurrentNewsViewProtocol>
@property (nonatomic, weak) IBOutlet UITableView *newsTableView;
@property (nonatomic, strong) id<CurrentNewsPresentProtocol> presenter;

@end
