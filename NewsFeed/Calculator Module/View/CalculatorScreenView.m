//
//  CalculatorScreenView.m
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorScreenView.h"

@interface CalculatorScreenView ()

@end

@implementation CalculatorScreenView
@synthesize presenter = _presenter;
@synthesize valueLabel = _valueLabel;
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.presenter viewFinishedLoading];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showValue:(NSString *) value {
    _valueLabel.text = value;
}
- (IBAction)buttonZeroPressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonZero];
}

- (IBAction)buttonOnePressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonOne];
}

- (IBAction)buttonTwoPressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonTwo];
}

- (IBAction)buttonThreePressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonThree];
}

- (IBAction)buttonFourPressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonFour];
}

- (IBAction)buttonFivePressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonFive];
}

- (IBAction)buttonSixPressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonSix];
}

- (IBAction)buttonSevenPressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonSeven];
}

- (IBAction)buttonEightPressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonEight];
}

- (IBAction)buttonNinePressed:(id)sender {
    [self.presenter buttonNumberPressed:(numbers) buttonNine];
}

- (IBAction)buttonPlusPressed:(id)sender {
    [self.presenter buttonOperationPressed:(operation) plus];
}

- (IBAction)buttonMinusPressed:(id)sender {
    [self.presenter buttonOperationPressed:(operation) minus];
}

- (IBAction)buttonMultiplyPressed:(id)sender {
    [self.presenter buttonOperationPressed:(operation) multiply];
}

- (IBAction)buttonDividePressed:(id)sender {
    [self.presenter buttonOperationPressed:(operation) divide];
}

- (IBAction)buttonEqualPressed:(id)sender{
    [self.presenter buttonOperationPressed:(operation) equal];
}

@end
