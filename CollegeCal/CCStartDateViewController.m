//
//  CCStartDateViewController.m
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCStartDateViewController.h"

@interface CCStartDateViewController ()

@end

@implementation CCStartDateViewController
@synthesize event = _event;
@synthesize dateLabel = _dateLabel;
@synthesize datePicker = _datePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dateLabel.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    self.datePicker.date = self.event.eventStartDate;
    [self updateLabel];
    
}

- (void)updateLabel {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    NSString *dateString = [dateFormatter stringFromDate:self.datePicker.date];
    [UIView transitionWithView:self.dateLabel
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        self.dateLabel.text = dateString;
                        
                    }
                    completion:nil];
    
}

- (IBAction)userSelectedDate:(id)sender {
    
    if ([self.datePicker.date timeIntervalSinceNow] < 0) {
        
        [self.datePicker setDate:[NSDate date] animated:YES];
        [self updateLabel];
        
    } else {
        
        [self updateLabel];
        self.event.eventStartDate = self.datePicker.date;
        
    }
    
}
@end
