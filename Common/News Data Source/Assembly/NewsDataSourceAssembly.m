//
//  NewsDataSourceAssembly.m
//  AppsFeed
//
//  Created by User on 01.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsDataSourceAssembly.h"
#import "NewsDataSource.h"

@implementation NewsDataSourceAssembly

- (NewsDataSource *)newsDataSource {
    return [TyphoonDefinition withClass:[NewsDataSource class] configuration:^(TyphoonDefinition *definition) {
    }];
}

@end
