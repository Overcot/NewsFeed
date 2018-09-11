//
//  CalculatorScreenPresenter.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorScreenPresenterProtocol.h"
@interface CalculatorScreenPresenter : NSObject <CalculatorScreenPresenterProtocol>
@property (nonatomic, weak) id<CalculatorScreenViewProtocol> view;
@property (nonatomic, strong) id<CalculatorScreenInteractorProtocol> interactor;

- (void) viewFinishedLoading;
- (void) presentValue:(NSInteger)value;
- (void) buttonNumberPressed:(numbers) value;
- (void) buttonOperationPressed:(operation) operation;

@end
