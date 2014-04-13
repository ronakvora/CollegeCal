//
//  CCEventColorOptionViewController.m
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEventColorOptionViewController.h"

@interface CCEventColorOptionViewController ()

@end

@implementation CCEventColorOptionViewController
@synthesize red = _red;

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
    self.red.colorOption = CCTagColorOptionRed;
    self.green.colorOption = CCTagColorOptionGreen;
    self.blue.colorOption = CCTagColorOptionBlue;
    self.orange.colorOption = CCTagColorOptionOrange;
    self.purple.colorOption = CCTagColorOptionPurple;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)userRed:(id)sender {
    
    self.event.colorOption = CCTagColorOptionRed;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)userGreen:(id)sender {
    
    self.event.colorOption = CCTagColorOptionGreen;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)userBlue:(id)sender {
    
    self.event.colorOption = CCTagColorOptionBlue;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)userOrange:(id)sender {
    
    self.event.colorOption = CCTagColorOptionOrange;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)userPurple:(id)sender {
    
    self.event.colorOption = CCTagColorOptionPurple;
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
