//
//  CalculatorScreenInteractor.m
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorScreenInteractor.h"

@implementation CalculatorScreenInteractor
@synthesize presenter = _presenter;
@synthesize entity = _entity;



- (void) loadLastValue {
    if (!_entity) {
        _entity = [[CalculatorEntity alloc] init];        
    }
    [self.presenter presentValue:[_entity getFirstValue]];

}
- (void) numberPressed:(int)number{
    [self addNumberToValue:number]; //need to add to correct value and then present this value
    if ([self.entity getFirstOperation] == none || [self.entity getFirstOperation] == equal) {
        [self.presenter presentValue:_entity.getFirstValue];
    } else {
        [self.presenter presentValue:_entity.getSecondValue];
    }
}

- (void) operationPressed:(operation)operation {
    [self.entity setOperation:operation];
    if (operation == equal) {
        [self.entity countValues];
    }
    [self.presenter presentValue:_entity.getFirstValue];
}

- (void) addNumberToValue:(int)number {
    if ([self.entity getFirstOperation] == none) {
        [self addNumberToFirstValue:number];
    } else {
        if ([self.entity getSecondOperation] == none) {
            [self.entity setSecondValue:0];
        }
        [self.entity setSecondValue:[self.entity getSecondValue] * 10 + number];
    }
}
- (void) addNumberToFirstValue:(int)number {
    [self.entity setFirstValue:[self.entity getSecondValue] * 10 + number];
}
- (void) addNumberToSecondValue:(int)number {
    [self.entity setSecondValue:[self.entity getSecondValue] * 10 + number];
}
@end
