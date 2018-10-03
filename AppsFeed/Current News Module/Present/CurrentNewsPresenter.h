//
//  CurrentNewsPresenter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CurrentNewsViewControllerProtocol.h"
#import "CurrentNewsInteractProtocol.h"
#import "CurrentNewsRouterProtocol.h"
#import "CurrentNewsPresentProtocol.h"

@protocol CurrentNewsPresentProtocol;
@protocol CurrentNewsViewControllerProtocol;
@protocol CurrentNewsInteractProtocol;
@protocol CurrentNewsRouterProtocol;

@interface CurrentNewsPresenter : NSObject <CurrentNewsPresentProtocol>

@property (nonatomic, strong) id<CurrentNewsInteractProtocol> interactor;
@property (nonatomic, weak) id<CurrentNewsViewControllerProtocol> view;
@property (nonatomic, strong) id<CurrentNewsRouterProtocol> router;

- (NSInteger) getAmountOfSections;
- (id<NewsModelProtocol>)getCellDataForIndexPath:(NSIndexPath *)indexPath;

@end
