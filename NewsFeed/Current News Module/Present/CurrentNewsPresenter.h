//
//  CurrentNewsPresenter.h
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrentNewsPresent.h"
#import "NewsModelProtocol.h"
#import "CurrentNewsInteract.h"

@class CurrentNewsView;


@interface CurrentNewsPresenter : NSObject <CurrentNewsPresent>
@property (nonatomic, strong) id<CurrentNewsInteract> interactor;
@property (nonatomic, weak) CurrentNewsView *view;
- (NSString *) presentDate;
- (NSString *) presentTitle;
- (NSString *) presentDescr;
- (int) amountOfCells;
- (void) setupView;

@end
