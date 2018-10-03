//
//  AddNewsRouter.m
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsRouter.h"

@implementation AddNewsRouter

- (void)goBackToNewsMainScreen:(UIViewController<AddNewsViewControllerProtocol> *) view {
    [view.navigationController popViewControllerAnimated:YES];
}

@end
