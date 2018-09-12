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

@interface CalculatorScreenView : UIViewController <CalculatorScreenViewProtocol>
@property (nonatomic, strong) id<CalculatorScreenPresenterProtocol> presenter;
@property (nonatomic, strong) IBOutlet UILabel *valueLabel;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *allButtons;



- (void) showValue:(NSString *) value;
- (IBAction)buttonZeroPressed:(id)sender;
- (IBAction)buttonOnePressed:(id)sender;
- (IBAction)buttonTwoPressed:(id)sender;
- (IBAction)buttonThreePressed:(id)sender;
- (IBAction)buttonFourPressed:(id)sender;
- (IBAction)buttonFivePressed:(id)sender;
- (IBAction)buttonSixPressed:(id)sender;
- (IBAction)buttonSevenPressed:(id)sender;
- (IBAction)buttonEightPressed:(id)sender;
- (IBAction)buttonNinePressed:(id)sender;
- (IBAction)buttonPlusPressed:(id)sender;
- (IBAction)buttonMinusPressed:(id)sender;
- (IBAction)buttonMultiplyPressed:(id)sender;
- (IBAction)buttonDividePressed:(id)sender;
- (IBAction)buttonEqualPressed:(id)sender;
- (IBAction)buttonResetPressed:(id)sender;
- (IBAction)buttonChangeSignPressed:(id)sender;
- (IBAction)buttonPercentPressed:(id)sender;
- (IBAction)buttonDotPressed:(id)sender;
@end
