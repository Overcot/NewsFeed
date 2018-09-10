//
//  CurrentNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsPresenter.h"

@implementation CurrentNewsPresenter

static int const amountOfCells = 3;

@synthesize interactor = _interactor;
@synthesize view = _view;
- (NSString *) presentDate {
    return [self.interactor getDate];
}

- (NSString *)presentDescr {
    return [self.interactor getDescr];
}

- (NSString *)presentTitle {
    return [self.interactor getTitle];
}

- (int) amountOfCells {
    return amountOfCells;
}
- (void) setupView {
    
}
#pragma mark - implement cellForRowAtIndex

@end
