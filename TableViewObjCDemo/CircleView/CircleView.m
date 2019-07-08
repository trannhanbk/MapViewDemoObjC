//
//  CircleView.m
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/3/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import "CircleView.h"
#import <UIKit/UIKit.h>

@implementation CircleView

-(void) clear {
    outGoingLine = nil;
    inComingLine = nil;
    inComingCircle = nil;
    outGoingCircle = nil;
    [self setNeedsDisplay];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.multipleTouchEnabled = NO;
    }
    return self;
}

-(CAShapeLayer*)lineto:(CircleView*)circle {
    UIBezierPath * path;
    [path moveToPoint:self.center];
    [path addLineToPoint: circle.center];
    
    CAShapeLayer * line;
    line.path = [path CGPath];
    line.lineWidth = 3;
    line.strokeColor = UIColor.redColor.CGColor;
    circle->inComingLine = line;
    outGoingLine = line;
    outGoingCircle = circle;
    circle->inComingCircle = self;
    return line;
}

@end
