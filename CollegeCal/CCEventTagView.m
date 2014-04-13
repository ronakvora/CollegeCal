//
//  CCEventTagView.m
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEventTagView.h"

@implementation CCEventTagView

@synthesize colorOption = _colorOption;

- (void)setColorOption:(CCTagColorOption)colorOption {
    
    self->_colorOption = colorOption;
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    if (self.colorOption == CCTagColorOptionRed) {
        
        
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.886 green: 0 blue: 0 alpha: 1];
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 25, 25)];
        [color setFill];
        [ovalPath fill];
        
    } else if (self.colorOption == CCTagColorOptionOrange) {
        
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 1 green: 0.705 blue: 0.114 alpha: 1];
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 25, 25)];
        [color setFill];
        [ovalPath fill];

        
    } else if (self.colorOption == CCTagColorOptionBlue) {
        
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.114 green: 0.114 blue: 1 alpha: 1];
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 25, 25)];
        [color setFill];
        [ovalPath fill];

        
    } else if (self.colorOption == CCTagColorOptionGreen) {
        
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0 green: 0.886 blue: 0 alpha: 1];
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 25, 25)];
        [color setFill];
        [ovalPath fill];
        
        
    } else {
        
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.41 green: 0.114 blue: 1 alpha: 1];
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 25, 25)];
        [color setFill];
        [ovalPath fill];

    }
    
}


@end
