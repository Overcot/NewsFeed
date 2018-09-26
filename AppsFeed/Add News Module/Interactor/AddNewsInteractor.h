//
//  AddNewsInteractor.h
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddNewsInteractorProtocol.h"

@interface AddNewsInteractor : NSObject <AddNewsInteractorProtocol>

- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr;
@end
