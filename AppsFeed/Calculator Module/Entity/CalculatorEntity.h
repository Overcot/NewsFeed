//
//  CalculatorEntity.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorEntityProtocol.h"
@interface CalculatorEntity : NSObject <CalculatorEntityProtocol>
@property (nonatomic, assign) double firstValue;
@property (nonatomic, assign) double secondValue;
@property (nonatomic, assign) BOOL typingFirst;
@property (nonatomic, assign) BOOL typingSecond;
@property (nonatomic, assign) BOOL typingFloat;
@property (nonatomic, assign) int amountOfNumbersAfterDot;
@property (nonatomic, assign) Operation operation;

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

- (void) setOperation:(Operation) operation;

- (int) getAmountOfNumbersAfterDot;
- (void) setAmountOfNumbersAfterDot:(int)number;

- (void) countValues;

@end
