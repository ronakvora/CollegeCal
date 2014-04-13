//
//  CCEventDetailsViewController.h
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCEvent.h"

@interface CCEventDetailsViewController : UIViewController

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) CCEvent *event;

@end
