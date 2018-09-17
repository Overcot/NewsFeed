//
//  CurrentNewsPresenter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrentNewsPresentProtocol.h"
#import "NewsModelProtocol.h"
#import "CurrentNewsInteractProtocol.h"

@protocol CurrentNewsViewControllerProtocol;
@protocol CurrentNewsInteractProtocol;

@interface CurrentNewsPresenter : NSObject <CurrentNewsPresentProtocol>
@property (nonatomic, strong) id<CurrentNewsInteractProtocol> interactor;
@property (nonatomic, weak) id<CurrentNewsViewControllerProtocol> view;

@end
