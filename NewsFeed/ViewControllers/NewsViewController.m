//
//  NewsViewController.m
//  NewsFeed
//
//  Created by Alex Ivashko on 31.08.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "NewsViewController.h"

@implementation NewsViewController
static NSString *const navigationTitle = @"Новости";
static NSString *const emptyString = @"";
static NSString *const errorTitle = @"Ошибка";
static NSString *const errorDescription = @"Ошибка загрузки новостей";
static NSString *const okButtonTitle = @"Ок";
static NSString *const openNewsSegueIdentifier = @"openNewsSegue";
static NSString *const storyBoardName = @"Main";

@synthesize newsTableView = _newsTableView;
@synthesize newsManager = _newsManager;
@synthesize activityIndicator = _activityIndicator;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    _newsManager = [[NewsManager alloc] init];
    [_newsManager refreshNews];
    
    self.navigationItem.title = navigationTitle;
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    self.newsManager.delegate = self;
    [self.newsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsPreviewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NewsPreviewCell class])];

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = NSStringFromClass([NewsPreviewCell class]);
    NewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    id<NewsModelProtocol> element = [_newsManager getNewsAtIndex:indexPath.row];

    if (![element.date isKindOfClass:[NSNull class]]) {
        cell.dateLabel.text = element.date;
    } else {
        cell.dateLabel.text = emptyString;
    }
    if (![element.title isKindOfClass:[NSNull class]]) {
        cell.titleLabel.text = element.title;
    } else {
        cell.titleLabel.text = emptyString;
    }
    if (![element.descr isKindOfClass:[NSNull class]]) {
        cell.descrLabel.text = element.descr;
    } else {
        cell.descrLabel.text = emptyString;
    }
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section {
    return [_newsManager getNewsCount];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    UIStoryboard *sbt = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
    CurrentNewsViewController *currentNews = [sbt instantiateViewControllerWithIdentifier:NSStringFromClass([CurrentNewsViewController class])];
    currentNews.news = [_newsManager getNewsAtIndex:indexPath.row];
    [self.navigationController pushViewController:currentNews animated:YES];

}

- (void) didFinishDownload {
    [self.activityIndicator stopAnimating];
    [self.newsTableView reloadData];
}

- (void) errorDownloading{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:errorTitle
                                                                   message:errorDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:okButtonTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                                  [self.newsManager refreshNews];
                                                          }];
    
    [alert addAction:defaultAction];

    [self presentViewController:alert animated:YES completion:nil];
}


@end
