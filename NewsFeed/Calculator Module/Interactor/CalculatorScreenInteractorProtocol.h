//
//  CalculatorScreenInteractorProtocol.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "CalculatorScreenPresenterProtocol.h"
#import "CalculatorEntityProtocol.h"
#import "CalculatorTypes.h"
@protocol CalculatorScreenPresenterProtocol;
@protocol CalculatorEntityProtocol;

@protocol CalculatorScreenInteractorProtocol <NSObject>
@property (nonatomic, weak) id<CalculatorScreenPresenterProtocol> presenter;
@property (nonatomic, strong) id<CalculatorEntityProtocol> entity;

- (void) loadLastValue;
- (void) numberPressed:(int) number;
- (void) operationPressed:(operation) operation;

- (void) addNumberToValue:(int) number;
- (void) addNumberToFirstValue:(int) number;
- (void) addNumberToSecondValue:(int) number;
@end
