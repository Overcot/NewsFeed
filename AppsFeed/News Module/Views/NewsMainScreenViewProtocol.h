//
//  MainScreenViewProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NewsMainScreenPresenterProtocol.h"
@protocol NewsMainScreenPresenterProtocol;

@protocol NewsMainScreenViewProtocol <NSObject, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) id<NewsMainScreenPresenterProtocol> presenter;

- (void) reloadData;
- (void) showError;

@end
