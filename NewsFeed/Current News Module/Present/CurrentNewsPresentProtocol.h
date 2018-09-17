//
//  CurrentNewsPresent.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrentNewsInteractProtocol.h"
#import "CurrentNewsViewControllerProtocol.h"

@protocol CurrentNewsInteractProtocol;
@protocol CurrentNewsViewControllerProtocol;

@protocol CurrentNewsPresentProtocol <NSObject, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) id<CurrentNewsInteractProtocol> interactor;
@property (nonatomic, weak) id<CurrentNewsViewControllerProtocol> view;

@end
