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
static NSString *const emptyString = @"";
static int const amountOfCells = 3;

@synthesize newsTableView = _newsTableView;
@synthesize news = _news;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
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
            if (![_news.date isKindOfClass:[NSNull class]]) {
                cell.textLabel.text = _news.date;
            } else {
                cell.textLabel.text = emptyString;
            }
            break;
        case 1:
            if (![_news.title isKindOfClass:[NSNull class]]) {
                cell.textLabel.text = _news.title;
            } else {
                cell.textLabel.text = emptyString;
            }
            break;
        case 2:
            if (![_news.descr isKindOfClass:[NSNull class]]) {
                cell.textLabel.text = _news.descr;
            } else {
                cell.textLabel.text = emptyString;
            }
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
    return amountOfCells;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
