//
//  ViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "FirstScreenView.h"

@interface FirstScreen ()

@end

@implementation FirstScreen

static NSString *const backButtonTitle = @"Назад";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setBackButtonName];
    
}

- (void) setBackButtonName {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)openNewsMainScreenView:(id)sender {
    NewsMainScreenRouter *router = [[NewsMainScreenRouter alloc] init];
    [self.navigationController pushViewController:(UIViewController *)router.view animated:YES];

}

- (IBAction)openCalculatorScreenView:(id)sender {
    CalculatorScreenRouter *router = [[CalculatorScreenRouter alloc] init];
    [self.navigationController pushViewController:(UIViewController *)router.view animated:YES];
}
@end
