//
//  AddNewsPresenter.h
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AddNewsPresenterProtocol.h"
#import "AddNewsInteractorProtocol.h"
#import "AddNewsRouterProtocol.h"

@interface AddNewsPresenter : NSObject <AddNewsPresenterProtocol>

@property (nonatomic, weak) UIViewController<AddNewsViewControllerProtocol> *view;
@property (nonatomic, strong) id<AddNewsInteractorProtocol> interactor;
@property (nonatomic, strong) id<AddNewsRouterProtocol> router;

- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr;
- (void)goBackToNewsMainScreen;


@end
