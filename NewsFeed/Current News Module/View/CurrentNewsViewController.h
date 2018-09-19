//
//  CurrentNewsViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentNewsViewControllerProtocol.h"
#import "CurrentNewsPresentProtocol.h"
@interface CurrentNewsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CurrentNewsViewControllerProtocol>
@property (nonatomic, strong) id<CurrentNewsPresentProtocol> presenter;

@end
