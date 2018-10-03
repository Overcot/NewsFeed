//
//  CurrentNewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsViewController.h"
#import "SelectedNewsCollectionViewCell.h"
#import "CurrentNewsCollectionViewFlowLayout.h"

@interface CurrentNewsViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@end


@implementation CurrentNewsViewController

@synthesize presenter = _presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.newsCollectionView.dataSource = self;
    self.newsCollectionView.delegate = self;
    [self.newsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SelectedNewsCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([SelectedNewsCollectionViewCell class])];
    self.newsCollectionView.collectionViewLayout = [[CurrentNewsCollectionViewFlowLayout alloc] init];
}
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self.newsCollectionView layoutIfNeeded];
    [self.newsCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:self.indexOfSelectedNews] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(CGRectGetWidth(collectionView.frame) - 40, (CGRectGetHeight(collectionView.frame)));
    } else {
        return CGSizeMake(CGRectGetWidth(collectionView.frame) - 60, (CGRectGetHeight(collectionView.frame)));
    }

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    } else {
        return UIEdgeInsetsMake(0, 10, 0, 0);
    }
}
//
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}
//- (NSIndexPath *)indexPathForPreferredFocusedViewInCollectionView:(UICollectionView *)collectionView {
//    return [[NSIndexPath alloc] initWithIndex:2];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <CurrentNewsViewControllerProtocol>

- (SelectedNewsCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = NSStringFromClass([SelectedNewsCollectionViewCell class]);
    SelectedNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model = [self.presenter getCellDataForIndexPath:indexPath];
    cell.layer.borderWidth = 2.0;
    return cell;

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.presenter getAmountOfSections];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;//[self.presenter tableView:tableView numberOfRowsInSection:section];

}

@end
