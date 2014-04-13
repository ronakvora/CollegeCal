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
@synthesize eventTagView = _eventTagView;
@synthesize startDateLabel = _startDateLabel;
@synthesize endDateLabel = _endDateLabel;
@synthesize reminderSwitch = _reminderSwitch;
@synthesize reminderView = _reminderView;
@synthesize eventTypeSegmenterControl = _eventTypeSegmenterControl;
@synthesize eventTabLabel = _eventTab;

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
    
    if ([self.event.eventEndDate timeIntervalSinceDate:self.event.eventStartDate] < 0) {
        
        NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDateComponents *dateComponents = [calender components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute) fromDate:self.event.eventStartDate];
        
        dateComponents.minute += 30;
        
        NSDate *defualtEnd = [calender dateFromComponents:dateComponents];
        self.event.eventEndDate = defualtEnd;
        
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
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
    
    self.eventTagView.colorOption = self.event.colorOption;
    
    switch (self.eventTagView.colorOption) {
        case CCTagColorOptionRed:
            
            self.eventTabLabel.text = @"Red";
            break;
            
        case CCTagColorOptionBlue:
            self.eventTabLabel.text = @"Blue";
            break;
            
        case CCTagColorOptionGreen:
            self.eventTabLabel.text = @"Green";
            break;
            
        case CCTagColorOptionOrange:
            self.eventTabLabel.text = @"Orange";
            break;
            
        default:
            self.eventTabLabel.text = @"Purple";
            break;
    }
    
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
        
    } else if ([[segue identifier] isEqualToString:@"ColorSegue"]) {
        
        CCEventColorOptionViewController *viewController = (CCEventColorOptionViewController *)[segue destinationViewController];
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

- (IBAction)userToggleSwitch:(id)sender {
    
    self.reminderView.hidden = NO;
    
    if ([self.reminderSwitch isOn]) {
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             
                             self.reminderView.alpha = 1.0;
                             
                         } completion:nil];
        
        
        
        
    } else {
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             
                             self.reminderView.alpha = 0.0;
                             
                         }
                         completion:^(BOOL finished) {
                            
                             self.reminderView.hidden = YES;
                             
                         }];
        
    }
    
}
@end
