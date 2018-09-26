//
//  AddNewsPresenterProtocol.h
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol AddNewsViewControllerProtocol;

@protocol AddNewsPresenterProtocol

- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr;

@end
