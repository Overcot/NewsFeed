//
//  CalculatorScreenView.m
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CalculatorScreenViewController.h"

@interface CalculatorScreenViewController ()
@property (nonatomic, strong) IBOutlet UILabel *valueLabel;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *allButtons;

@end

@implementation CalculatorScreenViewController
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

#pragma mark - Visual Borders

- (void) createBorderForButtons {
    for (UIButton* button in self.allButtons) {
        button.layer.borderWidth = 0.5f;
        button.layer.borderColor = [UIColor grayColor].CGColor;
    }
}

#pragma mark - <CalculatorScreenViewProtocol>

- (void) showValue:(NSString *) value {
    self.valueLabel.text = value;
}


#pragma mark - Button Functions

- (IBAction)buttonNumberPressed:(UIButton*)sender {
    [self.presenter buttonNumberPressed: sender.tag];
}

- (IBAction)buttonOperationPressed:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self.presenter buttonOperationPressed:(Operation) equal];
            break;
        case 1:
            [self.presenter buttonOperationPressed:(Operation) plus];
            break;
        case 2:
            [self.presenter buttonOperationPressed:(Operation) minus];
            break;
        case 3:
            [self.presenter buttonOperationPressed:(Operation) multiply];
            break;
        case 4:
            [self.presenter buttonOperationPressed:(Operation) divide];
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
