//
//  NewsModelProtocol.h
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsModelProtocol <NSObject>
@required
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descr;

@end

