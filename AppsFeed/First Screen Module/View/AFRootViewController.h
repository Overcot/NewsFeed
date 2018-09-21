//
//  ViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsMainScreenViewController.h"
#import "CalculatorScreenViewController.h"
#import "AFApplicationAssembly.h"

@class AFCalculatorAssembly;

@interface AFRootViewController: UIViewController

@property (nonatomic, strong) AFCalculatorAssembly *assembly;

- (IBAction)openNewsMainScreenView:(id)sender;
- (IBAction)openCalculatorScreenView:(id)sender;

@end

