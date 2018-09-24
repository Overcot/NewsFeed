//
//  AFRootViewControllerProtocol.h
//  AppsFeed
//
//  Created by User on 24.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol RootPresenterProtocol;

@protocol RootViewControllerProtocol <NSObject>

@property (nonatomic, strong) id<RootPresenterProtocol> presenter;

@end
