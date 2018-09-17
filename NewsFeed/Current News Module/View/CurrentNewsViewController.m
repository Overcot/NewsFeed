//
//  CurrentNewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsViewController.h"

@interface CurrentNewsViewController ()

@end

@implementation CurrentNewsViewController

@synthesize newsTableView = _newsTableView;
@synthesize presenter = _presenter;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
    
    [self.newsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.presenter tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section {
    return [self.presenter tableView:tableView numberOfRowsInSection:section];
}



@end