//
//  CalculatorEntityProtocol.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorTypes.h"
@protocol CalculatorEntityProtocol <NSObject>

- (double) getFirstValue;
- (double) getSecondValue;
- (void) setFirstValue:(double) value;
- (void) setSecondValue:(double) value;

- (BOOL) getTypingFirst;
- (BOOL) getTypingSecond;
- (void) setTypingFirst:(BOOL) state;
- (void) setTypingSecond:(BOOL) state;
- (BOOL) getTypingFloat;
- (void) setTypingFloat:(BOOL) state;
- (int) getAmountOfNumbersAfterDot;
- (void) setAmountOfNumbersAfterDot:(int)number;

- (void) setOperation:(operation) operation;

- (void) countValues;

@end
