//
//  MainScreenViewProtocol.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainScreenPresentProtocol.h"

@protocol MainScreenPresentProtocol;

@protocol MainScreenViewProtocol <NSObject>
@property (nonatomic, strong) id<MainScreenPresentProtocol> presenter;

- (void) reloadData;
- (void) showError;
@end

