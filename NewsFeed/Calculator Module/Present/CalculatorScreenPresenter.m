//
//  CalculatorScreenPresenter.m
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorScreenPresenter.h"

@implementation CalculatorScreenPresenter

- (void) viewFinishedLoading {
    [self.interactor loadLastValue];
}

- (void) presentValue:(double)value {
    if ((int) value == value) {
        [self.view showValue: [NSString stringWithFormat:@"%ld",(long) value]];
    } else {
        [self.view showValue: [NSString stringWithFormat:@"%f",(double) value]];
    }
}

- (void) buttonNumberPressed:(numbers) value {
    [self.interactor numberPressed: value];
}

- (void) buttonOperationPressed:(operation) operation {
    [self.interactor operationPressed: operation];
}

- (void) buttonResetPressed {
    [self.interactor fullReset];
}

- (void) buttonChangeSignPressed {
    [self.interactor changeSign];
}

- (void) buttonPercentPressed {
    [self.interactor percent];
}

- (void) buttonDotPressed {
    [self.interactor convertToDouble];
}
@end
