//
//  CurrentNewsViewProtocol.h
//  NewsFeed
//
//  Created by User on 11.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

@protocol CurrentNewsPresentProtocol;
@protocol NewsModelProtocol;

@protocol CurrentNewsViewControllerProtocol <NSObject>
@property (nonatomic, assign) NSInteger indexOfSelectedNews;

@end
