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
@property (nonatomic, assign) NSInteger firstValue;
@property (nonatomic, assign) NSInteger secondValue;

@property (nonatomic, assign) operation firstOperation;
@property (nonatomic, assign) operation secondOperation;

- (NSInteger) getFirstValue;
- (NSInteger) getSecondValue;
- (void) setOperation:(operation) operation;
- (operation) getFirstOperation;
- (operation) getSecondOperation;
- (void) countValues;
- (void) addNumberToValue:(int) number;
- (void) rememberOperation:(operation) operation;
@end
