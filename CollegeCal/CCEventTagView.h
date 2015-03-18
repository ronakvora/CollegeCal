//
//  CCEventTagView.h
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    CCTagColorOptionRed,
    CCTagColorOptionOrange,
    CCTagColorOptionBlue,
    CCTagColorOptionGreen,
    CCTagColorOptionPurple,
    
} CCTagColorOption;

@interface CCEventTagView : UIView

@property (nonatomic, assign) CCTagColorOption colorOption;

@end
