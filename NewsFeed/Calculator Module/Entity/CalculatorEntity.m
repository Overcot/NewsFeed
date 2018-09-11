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

@synthesize firstOperation = _firstOperation;
@synthesize secondOperation = _secondOperation;
-(instancetype) init {
    self = [super init];
    if (self) {
        _firstValue = 0;
        _secondValue = 0;
        _firstOperation = none;
        _secondOperation = none;
    }
    return self;
}

- (NSInteger) getFirstValue {
    return _firstValue;
}

- (NSInteger) getSecondValue {
    return _secondValue;
}
- (operation) getFirstOperation {
    return _firstOperation;
}
- (operation) getSecondOperation {
    return _secondOperation;
}
- (void) setOperation:(operation) operation {
    if (_firstOperation == none) {
        _firstOperation = operation;
    } else {
        if (_secondOperation == equal && operation != equal) {
            _firstOperation = operation;
            _secondOperation = none;
            _secondValue = _firstValue;
        } else {
            _secondOperation = operation;
        }
    }
}
- (void) addNumberToValue:(int) number {
    
    if (_firstOperation == none) {
        _firstValue = _firstValue * 10 + number;
    } else {
        if (_secondOperation == none) {
            _secondValue = 0;
        }
        _secondValue = _secondValue * 10 + number;
    }
    

}
- (void) countValues {
    
    switch (_firstOperation) {
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

}

- (void) rememberOperation:(operation) operation {
    _secondOperation = operation;
}
@end
