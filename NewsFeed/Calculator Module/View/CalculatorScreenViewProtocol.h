//
//  CalculatorScreenViewProtocol.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorScreenPresenterProtocol.h"

@protocol CalculatorScreenPresenterProtocol;

@protocol CalculatorScreenViewProtocol <NSObject>
@property (nonatomic, strong) id<CalculatorScreenPresenterProtocol> presenter;

- (void) showValue:(NSString *) value;

@end
