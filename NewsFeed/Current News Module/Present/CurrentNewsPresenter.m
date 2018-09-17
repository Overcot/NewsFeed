//
//  CurrentNewsPresenter.m
//  NewsFeed
//
//  Created by User on 10.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "CurrentNewsPresenter.h"

@implementation CurrentNewsPresenter

static int const amountOfCells = 3;

@synthesize interactor = _interactor;
@synthesize view = _view;

#pragma mark - <UITableViewDataSource>

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setUserInteractionEnabled:NO];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [self.interactor getDate];
            break;
        case 1:
            cell.textLabel.text = [self.interactor getTitle];
            break;
        case 2:
            cell.textLabel.text = [self.interactor getDescr];
            break;
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return amountOfCells;
}

@end
