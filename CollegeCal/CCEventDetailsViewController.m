//
//  CCEventDetailsViewController.m
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEventDetailsViewController.h"

@interface CCEventDetailsViewController ()

@end

@implementation CCEventDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSData *eventData = [[CCEvent savedEvents] objectAtIndex:self.index];
    self.event = [NSKeyedUnarchiver unarchiveObjectWithData:eventData];
    self.title = self.event.eventName;
    
}

- (void)updateEvent {
    
    NSData *eventData = [NSKeyedArchiver archivedDataWithRootObject:self.event];
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:[CCEvent savedEvents]];
    [newArray replaceObjectAtIndex:self.index withObject:eventData];
    [[NSUserDefaults standardUserDefaults] setObject:newArray forKey:@"EventsKey"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
