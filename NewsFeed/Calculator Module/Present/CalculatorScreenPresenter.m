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

- (void) presentValue:(NSInteger)value {
    [self.view showValue: [NSString stringWithFormat:@"%ld",(NSInteger) value]];
}
- (void) buttonNumberPressed:(numbers) value {
    [self.interactor numberPressed: value];
}
- (void) buttonOperationPressed:(operation) operation {
    [self.interactor operationPressed: operation];
}



@end
