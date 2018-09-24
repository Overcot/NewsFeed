//
//  ViewController.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootPresenterProtocol.h"
#import "RootViewControllerProtocol.h"

@interface RootViewController: UIViewController <RootViewControllerProtocol>

@property (nonatomic, strong) id<RootPresenterProtocol> presenter;

- (IBAction)openNewsMainScreenView:(id)sender;
- (IBAction)openCalculatorScreenView:(id)sender;

@end

