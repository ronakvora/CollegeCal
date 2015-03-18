//
//  CCEndDateViewController.m
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEndDateViewController.h"

@interface CCEndDateViewController ()

@end

@implementation CCEndDateViewController
@synthesize datePicker = _datePicker;
@synthesize dateLabel = _dateLabel;
@synthesize event = _event;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dateLabel.text = @"";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    self.datePicker.date = self.event.eventEndDate;
    [self updateLabel];
    
}

- (void)updateLabel {
    
    NSTimeInterval interval = [self.datePicker.date timeIntervalSinceDate:self.event.eventStartDate];
    
    NSInteger seconds = (NSInteger)interval;
    
    NSInteger days = 0;
    NSInteger hours = 0;
    NSInteger minutes = 0;
    
    while (seconds >= 86400) {
        
        seconds -= 86400;
        days++;
        
    }
    
    while (seconds >= 3600) {
        
        seconds -= 3600;
        hours++;
        
    }
    
    while (seconds >= 60) {
        
        seconds -= 60;
        minutes++;
        
    }
    
    NSString *durationString = [NSString stringWithFormat:@"%liD %liH %liM", (long)days, (long)hours, (long)minutes];
    
    [UIView transitionWithView:self.dateLabel
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        self.dateLabel.text = durationString;
                        
                    }
                    completion:nil];
    
}

- (IBAction)userPickedDate:(id)sender {
    
    if ([self.datePicker.date timeIntervalSinceDate:self.event.eventStartDate] < 0) {
        
        [self.datePicker setDate:self.event.eventStartDate animated:YES];
        [self updateLabel];
        
    } else {
        
        self.event.eventEndDate = self.datePicker.date;
        [self updateLabel];
        
    }
    
}
@end
