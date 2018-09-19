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

#pragma mark - <CalculatorScreenInteractorProtocol>

- (void) loadLastValue {
    if (!self.entity) {
        self.entity = [[CalculatorEntity alloc] init];        
    }
    [self.presenter presentValue:[self.entity getFirstValue]];
}

- (void) numberPressed:(NSInteger) number{
    if ([self.entity getTypingFirst] == YES) {
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

- (void) operationPressed:(Operation)operation {

    if ([self.entity getTypingFirst] == YES) {
        // if we are typing first number and then pressed operation we need to stop entering first number
        if (operation == equal) {
            // if operation is equal we need to present first number and reset everything
            [self.entity setOperation: none];
            [self.presenter presentValue:[self.entity getFirstValue]];
            [self.entity setFirstValue:0];
        } else {
            // if operation is another we save an operation and stop typing first number
            [self.entity setOperation:operation];
            [self.entity setTypingFirst:NO];
            [self.entity setSecondValue:[self.entity getFirstValue]];
            // we save this in case we press equal afterwards
            // if we press not equal we just go there again and switch operation
            // if we press number because of typingSecond = false we will start second number from start
            [self.presenter presentValue:[self.entity getFirstValue]];
        }
    } else {
        if ([self.entity getTypingSecond] == YES) {
            // if we were typing second number we stop to enter second number and proceed to count operation
            [self.entity setTypingSecond:NO];
            [self.entity countValues];
            if (operation != equal) {
                // if operation isn't equal we want to save both the operation and last calculated result and put it in second value
                // case: 23+25-= must be equal to 0
                [self.entity setOperation:operation];
                [self.entity setSecondValue:[self.entity getFirstValue]];
            }
            [self.presenter presentValue:[self.entity getFirstValue]];
        } else {
            // we go here for example if we did finish typing first number and didn't start typing second
            // case : 23+= must be 46
            // case : 23+- must be 23- and ready to input second number or equal operation
            if (operation == equal) {
                // if we have operation equal we just count straight away because we already saved first number to second value for future
                [self.entity countValues];
            } else {
                // case : 23-=+ goes here
                [self.entity setOperation:operation];
                [self.entity setSecondValue:[self.entity getFirstValue]];
            }
            [self.presenter presentValue:[self.entity getFirstValue]];
        }
    }
    [self.entity setAmountOfNumbersAfterDot:0];
    [self.entity setTypingFloat:NO];
}

- (void) changeSign {
    
    if ([self chooseNumberToChange]) {
        [self.entity setFirstValue: - [self.entity getFirstValue]];
        [self.presenter presentValue: [self.entity getFirstValue]];
    } else {
        [self.entity setSecondValue: - [self.entity getSecondValue]];
        [self.presenter presentValue:[self.entity getSecondValue]];
    }
}

- (void) percent {
    if ([self chooseNumberToChange]) {
        [self.entity setFirstValue:[self.entity getFirstValue]/100];
        [self.presenter presentValue:[self.entity getFirstValue]];
        [self.entity setTypingFirst:NO];
    } else {
        [self.entity setSecondValue:[self.entity getSecondValue]/100];
        [self.presenter presentValue:[self.entity getSecondValue]];
        [self.entity setTypingSecond:NO];
    }
}

- (void) convertToDouble {
    [self.entity setTypingFloat:YES];
    if ([self chooseNumberToChange]) {
        [self.presenter presentValue:[self.entity getFirstValue]];
    } else {
        [self.presenter presentValue:[self.entity getSecondValue]];
    }
}

- (void) fullReset {
    [self.entity setFirstValue:0];
    [self.entity setSecondValue:0];
    [self.entity setOperation:none];
    [self.entity setTypingFirst:YES];
    [self.entity setTypingSecond:NO];
    [self.entity setTypingFloat:NO];
    [self.presenter presentValue:[self.entity getFirstValue]];
}

#pragma mark - Interactor Methods

- (void) addNumberToFirstValue:(NSInteger)number {
    if ([self.entity getTypingFloat] == NO) {
        if ([self.entity getFirstValue] < 0) {
            [self.entity setFirstValue:[self.entity getFirstValue] * 10 - number];
        } else {
            [self.entity setFirstValue:[self.entity getFirstValue] * 10 + number];
        }
    } else {
        [self.entity setAmountOfNumbersAfterDot:[self.entity getAmountOfNumbersAfterDot]+1];
        if ([self.entity getFirstValue] < 0) {
            [self.entity setFirstValue:[self.entity getFirstValue] - (number / pow(10.0, [self.entity getAmountOfNumbersAfterDot]))];
        } else {
            [self.entity setFirstValue:[self.entity getFirstValue] + (number / pow(10.0, [self.entity getAmountOfNumbersAfterDot]))];
        }
    }
}

- (void) addNumberToSecondValue:(NSInteger)number {
    if ([self.entity getTypingFloat] == NO) {
        if ([self.entity getSecondValue] < 0) {
            [self.entity setSecondValue:[self.entity getSecondValue] * 10 - number];
        } else {
            [self.entity setSecondValue:[self.entity getSecondValue] * 10 + number];
        }
    } else {
        [self.entity setAmountOfNumbersAfterDot:[self.entity getAmountOfNumbersAfterDot]+1];
        if ([self.entity getSecondValue] < 0) {
            [self.entity setSecondValue:[self.entity getSecondValue] - (number / pow(10.0, [self.entity getAmountOfNumbersAfterDot]))];
        } else {
            [self.entity setSecondValue:[self.entity getSecondValue] + (number / pow(10.0, [self.entity getAmountOfNumbersAfterDot]))];
        }
        
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

@end
