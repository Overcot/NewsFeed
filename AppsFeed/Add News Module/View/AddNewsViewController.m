//
//  AddNewsViewController.m
//  AppsFeed
//
//  Created by User on 25.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsViewController.h"

@interface AddNewsViewController ()
- (IBAction)saveNews:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;


@end

@implementation AddNewsViewController

static NSString *const backButtonTitle = @"Назад";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNews:(UIBarButtonItem *)sender {
    NSDate *date = [self.datePicker date];
    NSString *title = [self.titleField text];
    NSString *descr = [self.descriptionField text];
    [self.presenter saveNews:date :title :descr];
}

@end
