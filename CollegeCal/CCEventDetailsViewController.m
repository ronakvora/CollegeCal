//
//  CCEventDetailsViewController.m
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEventDetailsViewController.h"

@interface CCEventDetailsViewController ()

@end

@implementation CCEventDetailsViewController

@synthesize myLabel;
@synthesize startLabel;
@synthesize endLabel;
@synthesize eventType;
@synthesize reminderButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSData *eventData = [[CCEvent savedEvents] objectAtIndex:self.index];
    self.event = [NSKeyedUnarchiver unarchiveObjectWithData:eventData];
    self.title = self.event.eventName;
    
    self.myLabel.text = self.event.eventName;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    self.startLabel.text = [self stringFromDate:self.event.eventStartDate];
    self.endLabel.text = [self stringFromDate:self.event.eventEndDate];
    self.eventType.selectedSegmentIndex = self.event.eventType;
    NSLog(@"%d", self.event.eventType);
    self.eventType.enabled = NO;
    
    
    
}

- (NSString *)stringFromDate:(NSDate *)theDate {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    NSString *rv = [dateFormatter stringFromDate:theDate];
    return rv;
    
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
