//
//  CurrentNewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsViewController.h"
#import "SelectedNewsCollectionViewCell.h"

#import "HitAndTestCurrentNewsUIView.h"
#import "CurrentNewsCollectionViewFlowLayout.h"


@interface CurrentNewsViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView *newsCollectionView;

@end


@implementation CurrentNewsViewController

static int const leftInset = 10;
static int const rightInset = 10;
static int const widthOfOtherCellsShown = 50;

@synthesize presenter = _presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.newsCollectionView.dataSource = self;
    self.newsCollectionView.delegate = self;
    [self.newsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SelectedNewsCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([SelectedNewsCollectionViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%@",[[self newsCollectionView] visibleCells]);
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    HitAndTestCurrentNewsUIView *subView = [[HitAndTestCurrentNewsUIView alloc] initWithCollectionView: self.newsCollectionView];
    [self.view addSubview:subView];
    [self.newsCollectionView layoutIfNeeded];
    self.newsCollectionView.collectionViewLayout = [[CurrentNewsCollectionViewFlowLayout alloc] init];
    [self.newsCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:self.indexOfSelectedNews] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    self.newsCollectionView.clipsToBounds = NO;
    [self.newsCollectionView.collectionViewLayout prepareLayout];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
    }];
}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width - 2*(leftInset+rightInset+widthOfOtherCellsShown), CGRectGetHeight(collectionView.frame));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

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


