//
//  CircleView.h
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/3/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView {
    
    CAShapeLayer *outGoingLine;
    CAShapeLayer *inComingLine;
    CircleView *inComingCircle;
    CircleView *outGoingCircle;
}

-(CAShapeLayer*)lineto:(CircleView*)circle;
-(void) clear;

@end
