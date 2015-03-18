//
//  CCStartDateViewController.h
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCEvent.h"

@interface CCStartDateViewController : UIViewController

@property (nonatomic, weak) CCEvent *event;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)userSelectedDate:(id)sender;

@end
