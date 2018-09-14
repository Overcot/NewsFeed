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
    [_presenter presentValue:[_entity getFirstValue]];

}

- (void) numberPressed:(int)number{
    if ([_entity getTypingFirst] == YES) {
        // true means only that first number is subject to change
        [self addNumberToFirstValue:number];
        [_presenter presentValue:[_entity getFirstValue]];
    } else {
        // typing second number
        if ([_entity getTypingSecond] == NO) {
            // check if we didn't start typing second number - then we need to 0 second value and remember that we will type this number
            [_entity setSecondValue:0];
            [_entity setTypingSecond:YES];

        }
        // then add number to current number(second) - either 0 or previous and show it
        [self addNumberToSecondValue:number];
        [_presenter presentValue:[_entity getSecondValue]];
    }
}

- (void) operationPressed:(operation)operation {
    
    
    if ([_entity getTypingFirst] == YES) {
        // if we are typing first number and then pressed operation we need to stop entering first number
        if (operation == equal) {
            // if operation is equal we need to present first number and reset everything
            [_entity setOperation: none];
            [_presenter presentValue:[_entity getFirstValue]];
            [_entity setFirstValue:0];
        } else {
            // if operation is another we save an operation and stop typing first number
            [_entity setOperation:operation];
            [_entity setTypingFirst:NO];
            [_entity setSecondValue:[_entity getFirstValue]];
            // we save this in case we press equal afterwards
            // if we press not equal we just go there again and switch operation
            // if we press number because of typingSecond = false we will start second number from start
            [_presenter presentValue:[_entity getFirstValue]];
        }
    } else {
        if ([_entity getTypingSecond] == YES) {
            // if we were typing second number we stop to enter second number and proceed to count operation
            [_entity setTypingSecond:NO];
            [_entity countValues];
            if (operation != equal) {
                // if operation isn't equal we want to save both the operation and last calculated result and put it in second value
                // case: 23+25-= must be equal to 0
                [_entity setOperation:operation];
                [_entity setSecondValue:[_entity getFirstValue]];
            }
            [_presenter presentValue:[_entity getFirstValue]];
        } else {
            // we go here for example if we did finish typing first number and didn't start typing second
            // case : 23+= must be 46
            // case : 23+- must be 23- and ready to input second number or equal operation
            if (operation == equal) {
                // if we have operation equal we just count straight away because we already saved first number to second value for future
                [_entity countValues];
                [_presenter presentValue:[_entity getFirstValue]];
            } else {
                // case : 23-=+ goes here
                [_entity setOperation:operation];
                [_entity setSecondValue:[_entity getFirstValue]];
                [_presenter presentValue:[_entity getFirstValue]];
            }

        }
    }
    [_entity setAmountOfNumbersAfterDot:0];
    [_entity setTypingFloat:NO];
}

- (void) addNumberToFirstValue:(int)number {
    if ([_entity getTypingFloat] == NO) {
        if ([_entity getFirstValue] < 0) {
            [_entity setFirstValue:[_entity getFirstValue] * 10 - number];
        } else {
            [_entity setFirstValue:[_entity getFirstValue] * 10 + number];
        }
    } else {
        [_entity setAmountOfNumbersAfterDot:[_entity getAmountOfNumbersAfterDot]+1];
        if ([_entity getFirstValue] < 0) {
            [_entity setFirstValue:[_entity getFirstValue] - (number / pow(10.0, [_entity getAmountOfNumbersAfterDot]))];
        } else {
            [_entity setFirstValue:[_entity getFirstValue] + (number / pow(10.0, [_entity getAmountOfNumbersAfterDot]))];
        }
    }
}


- (void) addNumberToSecondValue:(int)number {
    if ([_entity getTypingFloat] == NO) {
        if ([_entity getSecondValue] < 0) {
            [_entity setSecondValue:[_entity getSecondValue] * 10 - number];
        } else {
            [_entity setSecondValue:[_entity getSecondValue] * 10 + number];
        }
    } else {
        [_entity setAmountOfNumbersAfterDot:[_entity getAmountOfNumbersAfterDot]+1];
        if ([_entity getSecondValue] < 0) {
            [_entity setSecondValue:[_entity getSecondValue] - (number / pow(10.0, [_entity getAmountOfNumbersAfterDot]))];
        } else {
            [_entity setSecondValue:[_entity getSecondValue] + (number / pow(10.0, [_entity getAmountOfNumbersAfterDot]))];
        }

    }
}

- (void) changeSign {
    
    if ([self chooseNumberToChange]) {
        [_entity setFirstValue:-[_entity getFirstValue]];
        [_presenter presentValue: [_entity getFirstValue]];
    } else {
        [_entity setSecondValue:-[_entity getSecondValue]];
        [_presenter presentValue:[_entity getSecondValue]];
    }
}

- (void) percent {
    if ([self chooseNumberToChange]) {
        [_entity setFirstValue:[_entity getFirstValue]/100];
        [_presenter presentValue:[_entity getFirstValue]];
        [_entity setFirstValue:0];
    } else {
        [_entity setSecondValue:[_entity getSecondValue]/100];
        [_presenter presentValue:[_entity getSecondValue]];
        [_entity setSecondValue:0];
    }
}

- (void) convertToDouble {
    if ([self chooseNumberToChange]) {
        [_entity setTypingFloat:YES];
        [_presenter presentValue:[_entity getFirstValue]];
    } else {
        [_entity setTypingFloat:YES];
        [_presenter presentValue:[_entity getSecondValue]];
    }
}

/**
 * if return YES we need to change first number
 
 * if return NO we need to change second number
 **/
- (BOOL) chooseNumberToChange {

    if ([_entity getTypingSecond] == NO) {
        return YES;
    } else if ([_entity getTypingFirst] == NO) {
        return NO;
    } else {
        NSLog(@"strange");
        return -1;
    }
}

- (void) fullReset {
    [_entity setFirstValue:0];
    [_entity setSecondValue:0];
    [_entity setOperation:none];
    [_entity setTypingFirst:YES];
    [_entity setTypingSecond:NO];

    [_presenter presentValue:[_entity getFirstValue]];
}
@end
