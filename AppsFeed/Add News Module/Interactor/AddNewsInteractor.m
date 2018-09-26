//
//  AddNewsInteractor.m
//  AppsFeed
//
//  Created by User on 26.09.2018.
//  Copyright © 2018 Alex Ivashko. All rights reserved.
//

#import "AddNewsInteractor.h"
#import <CoreData/CoreData.h>
#import "AFAppDelegate.h"
#import "NewsComponents.h"
@interface AddNewsInteractor ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) AFAppDelegate *appDelegate;

@end


@implementation AddNewsInteractor
static NSString *const newsEntityName = @"News";

@synthesize managedObjectContext = _managedObjectContext;
@synthesize appDelegate = _appDelegate;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.appDelegate = (AFAppDelegate *)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = self.appDelegate.managedObjectContext;
    }
    return self;
}
- (void)saveNews:(NSDate *)date
                :(NSString *)title
                :(NSString *)descr {
    
    NewsComponents *item = [NSEntityDescription insertNewObjectForEntityForName:newsEntityName inManagedObjectContext:self.managedObjectContext];
    item.date = date;
    item.title = title;
    item.descr = descr;
    [self.appDelegate saveContext];
}
@end
