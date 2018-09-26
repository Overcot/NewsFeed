//
//  AddNewsViewController.h
//  AppsFeed
//
//  Created by User on 25.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewsViewControllerProtocol.h"
#import "AddNewsPresenterProtocol.h"

@interface AddNewsViewController : UIViewController <AddNewsViewControllerProtocol>

@property (nonatomic, strong) id<AddNewsPresenterProtocol> presenter;

@end
