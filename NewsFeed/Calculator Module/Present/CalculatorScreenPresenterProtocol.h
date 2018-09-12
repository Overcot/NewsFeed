//
//  CalculatorScreenPresenterProtocol.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorScreenInteractorProtocol.h"
#import "CalculatorScreenViewProtocol.h"
#import "CalculatorTypes.h"
@protocol CalculatorScreenInteractorProtocol;
@protocol CalculatorScreenViewProtocol;

@protocol CalculatorScreenPresenterProtocol <NSObject>
@property (nonatomic, weak) id<CalculatorScreenViewProtocol> view;
@property (nonatomic, strong) id<CalculatorScreenInteractorProtocol> interactor;

- (void) viewFinishedLoading;
- (void) presentValue:(double)value;
- (void) buttonNumberPressed:(numbers) value;
- (void) buttonOperationPressed:(operation) operation;
- (void) buttonResetPressed;
- (void) buttonChangeSignPressed;
- (void) buttonPercentPressed;
- (void) buttonDotPressed;
@end
