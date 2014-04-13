//
//  CCEventColorOptionViewController.h
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCEventTagView.h"
#import "CCEvent.h"

@interface CCEventColorOptionViewController : UIViewController

@property (nonatomic, weak) CCEvent *event;
@property (weak, nonatomic) IBOutlet CCEventTagView *red;
@property (weak, nonatomic) IBOutlet CCEventTagView *green;
@property (weak, nonatomic) IBOutlet CCEventTagView *blue;
@property (weak, nonatomic) IBOutlet CCEventTagView *orange;
@property (weak, nonatomic) IBOutlet CCEventTagView *purple;

- (IBAction)userRed:(id)sender;
- (IBAction)userGreen:(id)sender;
- (IBAction)userBlue:(id)sender;
- (IBAction)userOrange:(id)sender;
- (IBAction)userPurple:(id)sender;

@end
