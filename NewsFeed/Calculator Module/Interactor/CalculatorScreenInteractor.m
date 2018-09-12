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
    if (_entity.typingFirst == YES) {
        // true means only that first number is subject to change
        [self addNumberToFirstValue:number];
        [self.presenter presentValue:[self.entity getFirstValue]];
    } else {
        // typing second number
        if ([self.entity getTypingSecond] == NO) {
            // check if we didn't start typing second number - then we need to 0 second value and remember that we will type this number
            [self.entity setSecondValue:0];
            [self.entity setTypingSecond:YES];

        }
        // then add number to current number(second) - either 0 or previous and show it
        [self addNumberToSecondValue:number];
        [self.presenter presentValue:[self.entity getSecondValue]];
    }
}

- (void) operationPressed:(operation)operation {
    
    if (_entity.typingFirst == YES) {
        // if we are typing first number and then pressed operation we need to stop entering first number
        if (operation == equal) {
            // if operation is equal we need to present first number and reset everything
            _entity.operation = none;
            [self.presenter presentValue:_entity.firstValue];
            _entity.firstValue = 0;
        } else {
            // if operation is another we save an operation and stop typing first number
            _entity.operation = operation;
            _entity.typingFirst = NO;
            _entity.secondValue = _entity.firstValue;
            // we save this in case we press equal afterwards
            // if we press not equal we just go there again and switch operation
            // if we press number because of typingSecond = false we will start second number from start
            [self.presenter presentValue:_entity.firstValue];
        }
    } else {
        if (_entity.typingSecond == YES) {
            // if we were typing second number we stop to enter second number and proceed to count operation
            _entity.typingSecond = NO;
            [_entity countValues];
            
            if (operation != equal) {
                // if operation isn't equal we want to save both the operation and last calculated result and put it in second value
                // case: 23+25-= must be equal to 0
                _entity.operation = operation;
                _entity.secondValue = _entity.firstValue;
            }
            [self.presenter presentValue:_entity.firstValue];
        } else {
            // we go here for example if we did finish typing first number and didn't start typing second
            // case : 23+= must be 46
            // case : 23+- must be 23- and ready to input second number or equal operation
            if (operation == equal) {
                // if we have operation equal we just count straight away because we already saved first number to second value for future
                [_entity countValues];
                [self.presenter presentValue:_entity.firstValue];
            } else {
                // case : 23-=+ goes here
                _entity.operation = operation;
                _entity.secondValue = _entity.firstValue;
                [self.presenter presentValue:_entity.firstValue];
            }

        }
        
    }
}

- (void) addNumberToFirstValue:(int)number {
    if ([self.entity getFirstValue] < 0) {
        [self.entity setFirstValue:[self.entity getFirstValue] * 10 - number];
    } else {
        [self.entity setFirstValue:[self.entity getFirstValue] * 10 + number];
    }
}

- (void) addNumberToSecondValue:(int)number {
    if ([self.entity getSecondValue] < 0) {
        [self.entity setSecondValue:[self.entity getSecondValue] * 10 - number];
    } else {
        [self.entity setSecondValue:[self.entity getSecondValue] * 10 + number];
    }
}

- (void) changeSign {
    
    if ([self chooseNumberToChange]) {
        [self.entity setFirstValue:-[self.entity getFirstValue]];
        [self.presenter presentValue:[self.entity getFirstValue]];
    } else {
        [self.entity setSecondValue:-[self.entity getSecondValue]];
        [self.presenter presentValue:[self.entity getSecondValue]];
    }
}

- (void) percent {
    if ([self chooseNumberToChange]) {
        [self.entity setFirstValue:[self.entity getFirstValue]/100];
        [self.presenter presentValue:[self.entity getFirstValue]];
    } else {
        [self.entity setSecondValue:-[self.entity getSecondValue]/100];
        [self.presenter presentValue:[self.entity getSecondValue]];
    }
}

- (void) convertToDouble {
    if ([self chooseNumberToChange]) {
        [self.presenter presentValue:[self.entity getFirstValue]];
    } else {
        [self.presenter presentValue:[self.entity getSecondValue]];
    }
}

/**
 * if return YES we need to change first number
 
 * if return NO we need to change second number
 **/
- (BOOL) chooseNumberToChange {

    if ([self.entity getTypingSecond] == NO) {
        return YES;
    } else if ([self.entity getTypingFirst] == NO) {
        return NO;
    } else {
        NSLog(@"strange");
        return -1;
    }
}

- (void) fullReset {
    [self.entity setFirstValue:0];
    [self.entity setSecondValue:0];
    [self.entity setOperation:none];
    _entity.typingFirst = YES;
    _entity.typingSecond = NO;
    [self.presenter presentValue:_entity.getFirstValue];
}
@end
