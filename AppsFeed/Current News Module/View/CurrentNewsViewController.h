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
#import "NewsModelProtocol.h"

@interface CurrentNewsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, CurrentNewsViewControllerProtocol, UIGestureRecognizerDelegate>

@property (nonatomic, strong) id<CurrentNewsPresentProtocol> presenter;
@property (nonatomic, assign) NSInteger indexOfSelectedNews;

@end
