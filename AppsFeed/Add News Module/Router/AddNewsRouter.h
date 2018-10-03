//
//  AddNewsRouter.h
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AddNewsRouterProtocol.h"
#import "AddNewsViewControllerProtocol.h"

@interface AddNewsRouter : NSObject <AddNewsRouterProtocol>

- (void)goBackToNewsMainScreen:(UIViewController<AddNewsViewControllerProtocol> *)view;

@end
