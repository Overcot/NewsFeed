//
//  AddNewsViewController.m
//  AppsFeed
//
//  Created by User on 25.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsViewController.h"

@interface AddNewsViewController ()
@property (nonatomic, weak) IBOutlet UITableView *addNewsTableView;

@end

@implementation AddNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addNewsTableView.delegate = self;
    self.addNewsTableView.dataSource = self;
    // Do any additional setup after loading the view.
    //[self.addNewsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setUserInteractionEnabled:NO];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


@end
