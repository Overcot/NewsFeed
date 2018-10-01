//
//  NewsDataSourceAssembly.h
//  AppsFeed
//
//  Created by User on 01.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "TyphoonAssembly.h"
#import <CoreData/CoreData.h>

@class NewsDataSource;
@class NSManagedObjectContext;

@protocol NewsDataSourceAssembly <NSObject>

- (NewsDataSource *)newsDataSource;

@end

@interface NewsDataSourceAssembly : TyphoonAssembly<NewsDataSourceAssembly>


@end
