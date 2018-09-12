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
@property (nonatomic, assign) double firstValue;
@property (nonatomic, assign) double secondValue;

@property (nonatomic, assign) BOOL typingFirst;
@property (nonatomic, assign) BOOL typingSecond;
@property (nonatomic, assign) operation operation;

- (double) getFirstValue;
- (double) getSecondValue;

- (BOOL) getTypingFirst;
- (BOOL) getTypingSecond;

- (void) countValues;

@end
