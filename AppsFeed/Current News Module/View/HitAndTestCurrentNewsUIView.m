//
//  HitAndTestCurrentNewsUIView.m
//  AppsFeed
//
//  Created by User on 05.10.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "HitAndTestCurrentNewsUIView.h"

@implementation HitAndTestCurrentNewsUIView

- (instancetype)initWithCollectionView:(UICollectionView *) newsCollectionView {
    self = [super init];
    if (self) {
        self.newsCollectionView = newsCollectionView;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self.newsCollectionView;
    
}


@end
