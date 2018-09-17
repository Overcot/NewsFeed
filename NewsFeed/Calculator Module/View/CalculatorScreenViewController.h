//
//  CalculatorScreenView.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorScreenViewProtocol.h"
#import "CalculatorTypes.h"
#import <QuartzCore/QuartzCore.h>

@interface CalculatorScreenViewController : UIViewController <CalculatorScreenViewProtocol>
@property (nonatomic, strong) id<CalculatorScreenPresenterProtocol> presenter;
@property (nonatomic, strong) IBOutlet UILabel *valueLabel;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *allButtons;

- (void) showValue:(NSString *) value;
- (IBAction)buttonNumberPressed:(UIButton *)sender;
- (IBAction)buttonOperationPressed:(UIButton *)sender;
- (IBAction)buttonResetPressed:(id)sender;
- (IBAction)buttonChangeSignPressed:(id)sender;
- (IBAction)buttonPercentPressed:(id)sender;
- (IBAction)buttonDotPressed:(id)sender;

@end
