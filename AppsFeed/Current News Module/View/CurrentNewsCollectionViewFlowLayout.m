//
//  CurrentNewsCollectionViewFlowLayout.m
//  AppsFeed
//
//  Created by User on 08/10/2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsCollectionViewFlowLayout.h"

@implementation CurrentNewsCollectionViewFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}


// layout attributesfor index path
// если элемент левый или правый то смещать origin.x
// а в layoutAttributesForElementsInRect добавлять левый и правый

//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
//
//    NSMutableArray<UICollectionViewLayoutAttributes *> *attributesInRect = (NSMutableArray *)[super layoutAttributesForElementsInRect:rect];
//
//    for (int i = 0; i < attributesInRect.count; ++i) {
//        NSLog(@"%ld",(long)attributesInRect[i].indexPath.section);
//        UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForItemAtIndexPath:attributesInRect[i].indexPath];
//        [attribute setHidden:NO];
//        attributesInRect[i] = attribute;
//    }
//    NSIndexPath *newIndex = [NSIndexPath indexPathForRow:0 inSection:attributesInRect[attributesInRect.count - 1].indexPath.section + 1];
//    UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForItemAtIndexPath:newIndex];
//    [attribute setHidden:NO];
//    [attributesInRect addObject:attribute];
//    return attributesInRect;
//}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
