//
//  NewsModelProtocol2.h
//  NewsFeed
//
//  Created by Alex Ivashko on 05.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsModelDelegate <NSObject>
@required
- (void) didFinishDownload;
- (void) errorDownloading;

@end
