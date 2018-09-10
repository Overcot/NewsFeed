//
//  NewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "MainScreenView.h"

@implementation MainScreenView
static NSString *const navigationTitle = @"Новости";
static NSString *const emptyString = @"";
static NSString *const errorTitle = @"Ошибка";
static NSString *const errorDescription = @"Ошибка загрузки новостей";
static NSString *const okButtonTitle = @"Ок";
static NSString *const openNewsSegueIdentifier = @"openNewsSegue";
static NSString *const storyBoardName = @"Main";

@synthesize newsTableView = _newsTableView;
@synthesize activityIndicator = _activityIndicator;
@synthesize presenter = _presenter;


- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = navigationTitle;
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    [self.newsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsPreviewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NewsPreviewCell class])];

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = NSStringFromClass([NewsPreviewCell class]);
    NewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.dateLabel.text = [self.presenter presentDateAtIndex:(int)indexPath.row];
    cell.titleLabel.text = [self.presenter presentTitleAtIndex:(int)indexPath.row];
    cell.descrLabel.text = [self.presenter presentDescrAtIndex:(int)indexPath.row];
    return cell;
    
}



- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section {
    return [self.presenter getNewsCount];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    CurrentNewsRouter *router = [[CurrentNewsRouter alloc] init];
    router.interactor.news = [self.presenter getNewsAtIndex:(int)indexPath.row];

    [self.navigationController pushViewController:router.view animated:YES];

}

- (void) reloadData {
    [self.activityIndicator stopAnimating];
    [self.newsTableView reloadData];
}

- (void) showError {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:errorTitle
                                                                   message:errorDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:okButtonTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self.presenter refreshNews];
                                                          }];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end