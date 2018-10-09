//
//  HitAndTestCurrentNewsUIView.h
//  AppsFeed
//
//  Created by User on 05.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HitAndTestCurrentNewsUIView : UIView

@property (nonatomic, strong) UICollectionView *newsCollectionView;

-(instancetype) initWithCollectionView: (UICollectionView *) newsCollectionView;
@end
