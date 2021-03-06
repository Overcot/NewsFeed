//
//  NewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsMainScreenViewController.h"

@interface NewsMainScreenViewController ()
@property (nonatomic, weak) IBOutlet UITableView *newsTableView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)addNews:(UIBarButtonItem *)sender;

@end


@implementation NewsMainScreenViewController

static NSString *const navigationTitle = @"Новости";
static NSString *const emptyString = @"";
static NSString *const errorTitle = @"Ошибка";
static NSString *const errorDescription = @"Проверьте соединение с интернетом";
static NSString *const okButtonTitle = @"Ок";
static NSString *const refreshButtonTitle = @"Обновить";
static NSString *const openNewsSegueIdentifier = @"openNewsSegue";
static NSString *const storyBoardName = @"Main";

@synthesize newsTableView = _newsTableView;
@synthesize activityIndicator = _activityIndicator;
@synthesize presenter = _presenter;

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicator startAnimating];
    
    self.navigationItem.title = navigationTitle;
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    [self.newsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsPreviewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NewsPreviewCell class])];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshNews) forControlEvents:UIControlEventValueChanged];
    self.newsTableView.refreshControl = refreshControl;

    //[self.presenter viewFinishedLoading];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.presenter viewFinishedLoading];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self.presenter showFromViewControllerWithObject:self
                                                    :[self.presenter getNewsAtIndex:(int)indexPath.row]
                                                    :indexPath.row];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section {
    return [self.presenter tableView:tableView numberOfRowsInSection:section];
}

- (NewsPreviewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = NSStringFromClass([NewsPreviewCell class]);
    NewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.model = [self.presenter getNewsAtIndex:(int)indexPath.row];

    return cell;
    
}

-(void)refreshNews {
    [self.presenter refreshNews];
    [self.newsTableView.refreshControl endRefreshing];
}


#pragma mark - View Methods
- (void)reloadData {
    [self.activityIndicator stopAnimating];
    [self.newsTableView reloadData];

}

- (void) showError {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:errorTitle
                                                                   message:errorDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* refreshAction = [UIAlertAction actionWithTitle:refreshButtonTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self.presenter refreshNews];
                                                          }];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        
    }];
    [alert addAction:refreshAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)addNews:(UIBarButtonItem *)sender {
    if (sender.tag == 0) { //default
        [self.presenter showAddNewsViewController:self];
    }
}

@end
