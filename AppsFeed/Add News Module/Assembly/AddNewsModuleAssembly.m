//
//  AddNewsAssembly.m
//  AppsFeed
//
//  Created by User on 25.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsModuleAssembly.h"

#import "AddNewsViewController.h"
@implementation AddNewsModuleAssembly
- (AddNewsViewController *)addNewsViewController {
    return [TyphoonDefinition withClass:[AddNewsViewController class] configuration:^(TyphoonDefinition *definition) {
    }];
}
@end
