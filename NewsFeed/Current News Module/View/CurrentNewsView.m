//
//  CurrentNewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 03.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsView.h"

@interface CurrentNewsView ()

@end

@implementation CurrentNewsView

@synthesize newsTableView = _newsTableView;
@synthesize presenter = _presenter;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
     
    [self.presenter setupView];
    [self.newsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setUserInteractionEnabled:NO];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [self.presenter presentDate];
            break;
        case 1:
            cell.textLabel.text = [self.presenter presentTitle];
            break;
        case 2:
            cell.textLabel.text = [self.presenter presentDescr];
            break;
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section {
    return [self.presenter amountOfCells];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
