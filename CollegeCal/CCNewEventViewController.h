//
//  CCNewEventViewController.h
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCEvent.h"
#import "CCStartDateViewController.h"
#import "CCEndDateViewController.h"
#import "CCEventColorOptionViewController.h"
#import "CCEventTagView.h"

@interface CCNewEventViewController : UIViewController

@property (nonatomic, strong) CCEvent *event;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UISwitch *reminderSwitch;
@property (weak, nonatomic) IBOutlet UIView *reminderView;
@property (weak, nonatomic) IBOutlet CCEventTagView *eventTagView;
@property (weak, nonatomic) IBOutlet UILabel *eventTabLabel;


- (IBAction)userDone:(id)sender;
- (IBAction)userCancel:(id)sender;
- (IBAction)closeKeyboard:(id)sender;
- (IBAction)updateTitle:(id)sender;
- (IBAction)userToggleSwitch:(id)sender;

@end
