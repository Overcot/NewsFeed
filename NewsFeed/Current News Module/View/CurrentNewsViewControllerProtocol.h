//
//  CurrentNewsViewProtocol.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentNewsPresentProtocol.h"

@protocol CurrentNewsPresentProtocol;

@protocol CurrentNewsViewControllerProtocol <NSObject>
@property (nonatomic, strong) id<CurrentNewsPresentProtocol> presenter;

@end
