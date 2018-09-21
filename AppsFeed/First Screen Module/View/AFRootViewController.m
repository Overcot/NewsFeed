//
//  ViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AFRootViewController.h"
#import "AFCalculatorAssembly.h"


@interface AFRootViewController ()

@end

@implementation AFRootViewController
static NSString *const backButtonTitle = @"Назад";
static NSString *const storyBoardName = @"Main";

@synthesize assembly = _assembly;

- (instancetype)initWithAssembly:(AFCalculatorAssembly *)assembly {
    self = [super init];
    if (self) {
        _assembly = assembly;
    }
    return self;
}

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
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    NewsMainScreenViewController *view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([NewsMainScreenViewController class])];
    [self.navigationController pushViewController:view animated:YES];

}

- (IBAction)openCalculatorScreenView:(id)sender {
    CalculatorScreenViewController *view = [_assembly calculatorScreenViewController];
    [self.navigationController pushViewController:view animated:YES];
    /*
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    CalculatorScreenViewController *view = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CalculatorScreenViewController class])];
     */
}
@end
