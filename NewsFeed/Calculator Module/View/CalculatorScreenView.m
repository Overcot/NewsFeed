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
    [self createBorderForButtons];
    [self.presenter viewFinishedLoading];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showValue:(NSString *) value {
    _valueLabel.text = value;
}

#pragma mark - Visual Borders

- (void) createBorderForButtons {
    for (UIButton* button in self.allButtons) {
        button.layer.borderWidth = 0.5f;
        button.layer.borderColor = [UIColor grayColor].CGColor;
    }
}

#pragma mark - Button Functions

- (IBAction)buttonNumberPressed:(UIButton*)sender {
    [self.presenter buttonNumberPressed:(numbers) sender.tag];
}

- (IBAction)buttonOperationPressed:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self.presenter buttonOperationPressed:(operation) equal];
            break;
        case 1:
            [self.presenter buttonOperationPressed:(operation) plus];
            break;
        case 2:
            [self.presenter buttonOperationPressed:(operation) minus];
            break;
        case 3:
            [self.presenter buttonOperationPressed:(operation) multiply];
            break;
        case 4:
            [self.presenter buttonOperationPressed:(operation) divide];
            break;
        default:
            break;
    }
}

- (IBAction)buttonResetPressed:(id)sender {
    [self.presenter buttonResetPressed];
}

- (IBAction)buttonChangeSignPressed:(id)sender {
    [self.presenter buttonChangeSignPressed];
}

- (IBAction)buttonPercentPressed:(id)sender {
    [self.presenter buttonPercentPressed];
}

- (IBAction)buttonDotPressed:(id)sender{
    [self.presenter buttonDotPressed];
}



@end
