//
//  CCNewEventViewController.m
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCNewEventViewController.h"

@interface CCNewEventViewController ()

@end

@implementation CCNewEventViewController

@synthesize event = _event;
@synthesize nameTextField = _nameTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *dateComponents = [calender components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute) fromDate:[NSDate date]];
    
    dateComponents.minute += 30;
    
    NSDate *defualtEnd = [calender dateFromComponents:dateComponents];
    
    self.event = [CCEvent eventWithStartDate:[NSDate date] andEndDate:defualtEnd useCurrentLocation:NO];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    NSLog(@"%@", [dateFormatter stringFromDate:self.event.eventStartDate]);
    
    [UIView transitionWithView:self.startDateLabel
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        self.startDateLabel.text = [dateFormatter stringFromDate:self.event.eventStartDate];
                        
                    }
                    completion:nil];
    
    [UIView transitionWithView:self.endDateLabel
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                         self.endDateLabel.text = [dateFormatter stringFromDate:self.event.eventEndDate];
                        
                    }
                    completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"StartDateSegue"]) {
        
        CCStartDateViewController *viewController = (CCStartDateViewController *)[segue destinationViewController];
        viewController.event = self.event;
        
        
    } else if ([[segue identifier] isEqualToString:@"EndDateSegue"]) {
        
        CCEndDateViewController *viewController = (CCEndDateViewController *)[segue destinationViewController];
        viewController.event = self.event;
        
    }
    
}

- (IBAction)userDone:(id)sender {
    
    if ([self.nameTextField.text isEqualToString:@""]) {
        
        self.event.eventName = self.nameTextField.placeholder;
        
    } else {
        
        self.event.eventName = self.nameTextField.text;
        
    }
    [CCEvent saveEvent:self.event];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)userCancel:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)closeKeyboard:(id)sender {
    
    [sender resignFirstResponder];
    
}

- (IBAction)updateTitle:(id)sender {
    
    self.title = self.nameTextField.text;
    
}
@end
