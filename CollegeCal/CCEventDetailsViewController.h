//
//  CCEventDetailsViewController.h
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCEvent.h"

@interface CCEventDetailsViewController : UIViewController

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) CCEvent *event;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *eventType;
@property (weak, nonatomic) IBOutlet UISwitch *reminderButton;

@end
