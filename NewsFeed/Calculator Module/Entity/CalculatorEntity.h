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
@property (nonatomic, assign) NSInteger firstValue;
@property (nonatomic, assign) NSInteger secondValue;

@property (nonatomic, assign) operation firstOperation;
@property (nonatomic, assign) operation secondOperation;

- (NSInteger) getFirstValue;
- (NSInteger) getSecondValue;
- (void) setOperation:(operation) operation;
- (void) countValues;
- (operation) getFirstOperation;
- (operation) getSecondOperation;

- (void) addNumberToValue:(int) number;
- (void) rememberOperation:(operation) operation;

@end
