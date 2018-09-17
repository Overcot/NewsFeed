//
//  CalculatorEntity.m
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorEntity.h"

@implementation CalculatorEntity
@synthesize firstValue = _firstValue;
@synthesize secondValue = _secondValue;

@synthesize operation = _operation;
@synthesize typingFirst = _typingFirst;
@synthesize typingSecond = _typingSecond;
@synthesize typingFloat = _typingFloat;
@synthesize amountOfNumbersAfterDot = _amountOfNumbersAfterDot;

- (instancetype) init {
    self = [super init];
    if (self) {
        _firstValue = 0;
        _secondValue = 0;
        _operation = none;
        _typingFirst = YES;
        _typingSecond = NO;
        _typingFloat = NO;
    }
    return self;
}

- (double) getFirstValue {
    return _firstValue;
}

- (double) getSecondValue {
    return _secondValue;
}

- (void) setFirstValue:(double) value {
    _firstValue = value;
}

- (void) setSecondValue:(double) value {
    _secondValue = value;
}

- (BOOL) getTypingFirst {
    return _typingFirst;
}

-(BOOL) getTypingSecond {
    return _typingSecond;
}

- (void) setTypingFirst:(BOOL) state {
    _typingFirst = state;
}

- (void) setTypingSecond:(BOOL) state {
    _typingSecond = state;
}

- (void) setOperation:(operation) operation {
    _operation = operation;
}

- (void) setTypingFloat:(BOOL)state {
    _typingFloat = state;
}

- (BOOL) getTypingFloat {
    return _typingFloat;
}

- (int) getAmountOfNumbersAfterDot {
    return _amountOfNumbersAfterDot;
}

- (void) setAmountOfNumbersAfterDot:(int)number {
    _amountOfNumbersAfterDot = number;
}

- (void) countValues {
    
    switch (_operation) {
        case plus:
            _firstValue += _secondValue;
            break;
        case minus:
            _firstValue -= _secondValue;
            break;
        case multiply:
            _firstValue *= _secondValue;
            break;
        case divide:
            _firstValue /= _secondValue;
            break;
        default:
            break;
    }
    _typingFloat = NO;
}

@end
