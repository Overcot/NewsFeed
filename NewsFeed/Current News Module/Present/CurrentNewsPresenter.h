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

@protocol CurrentNewsViewProtocol;
@protocol CurrentNewsInteractProtocol;

@interface CurrentNewsPresenter : NSObject <CurrentNewsPresentProtocol>
@property (nonatomic, strong) id<CurrentNewsInteractProtocol> interactor;
@property (nonatomic, weak) id<CurrentNewsViewProtocol> view;

- (NSString *) presentDate;
- (NSString *) presentTitle;
- (NSString *) presentDescr;
- (int) amountOfCells;
- (void) setupView;

@end
