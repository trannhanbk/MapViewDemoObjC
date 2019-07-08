//
//  DrawViewController.m
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/3/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import "DrawViewController.h"
#import <UIKit/UIKit.h>
#import "CircleView.h"

#define COOKBOOK_PURPLE_COLOR [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

#define IS_IPAD    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define RESIZABLE(_VIEW_) [_VIEW_ setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth]


@interface TouchTrackerView : UIView  {
    UIBezierPath *path;
}
@end

@implementation  TouchTrackerView

-(void) clear {
    
    path = nil;
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    path = [UIBezierPath bezierPath];
    path.lineWidth = IS_IPAD? 0.8f : 4.0f;

    UITouch *touch = [touches anyObject];
    [path moveToPoint: [touch locationInView:self]];
    [path addLineToPoint: [touch locationInView:self]];
    [self setNeedsDisplay];
    
}


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event {
//
//    UITouch *touch = [touches anyObject];
//    [path addLineToPoint: [touch locationInView:self]];
//    [self setNeedsDisplay];
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [path addLineToPoint: [touch locationInView:self]];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent *)event {
    
    [self touchesEnded:touches withEvent:event];
    
}

- (void)drawRect:(CGRect)rect {
    [COOKBOOK_PURPLE_COLOR set];
    [path stroke];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.multipleTouchEnabled = NO;
    }
    return self;
}

@end

@interface DrawViewController () {
//    NSMutableArray<CircleView*> *arrayCircleView;
//    int * index;
//    CGPoint * lastPoint;
//    CircleView * newCircle;
}

@end

@implementation DrawViewController

- (void)clear {
    [(TouchTrackerView*)self.view clear ];
//    [ (CircleView*)self.view clear];
    
}

- (void)loadView {
    [super loadView];
    self.view = [[TouchTrackerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RESIZABLE(self.view);
    
//    self.view = [[CircleView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    RESIZABLE(self.view);
//
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    index = 0;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint currentPoint;
//    UITouch *touch = [touches anyObject];
//    currentPoint = [touch locationInView: self.view];
//
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint currentPoint;
//    UITouch *touch = [touches anyObject];
//    currentPoint = [touch locationInView: self.view];
//    [self addViewInScreenWhenTouchEnd: &currentPoint];
//    [self.view setNeedsDisplay];
//}
//
//-(void)addViewInScreenWhenTouchEnd:(CGPoint*)point {
//
//    CircleView  * circleView = [[CircleView alloc ] initWithFrame:(CGRectMake(point->x, point->y, 35, 35))];
//    circleView.backgroundColor = UIColor.redColor;
//    [ newCircle addSubview: circleView];
//    UIPanGestureRecognizer * singleFingerTag = [[UIPanGestureRecognizer alloc] initWithTarget:self
//                                                                                                                                                    action: @selector(didPan:)];
//
//    [circleView addGestureRecognizer: singleFingerTag];
//    [ arrayCircleView addObject: circleView];
//
//    if (arrayCircleView.count > 1 &&  *index >= 1 ) {
//        CAShapeLayer *layer;
//        CircleView * first = [CircleView init];
//        CircleView * second = [CircleView init];
//        first = [arrayCircleView objectAtIndex: (*index - 1)];
//        second = [arrayCircleView objectAtIndex: *index];
//        layer = [newCircle lineto:first];
//        [newCircle.layer addSublayer: layer];
////        [layer addSublayer: first.layer ]
//    }
//}
//
//- (void)didPan:(UITapGestureRecognizer *)gesture {
//     CircleView * gestureView = [CircleView init];
//
//    if (gesture.state == UIGestureRecognizerStateBegan) {
//        gestureView.center = [gesture locationInView:self.view];
//    }
//
//    CGPoint newCenter;
//    newCenter = [ gesture locationInView: self.view ];
//    NSInteger dX;
//    NSInteger dY;
//    dX = newCenter.x - gestureView.center.x;
//    dY = newCenter.y - gestureView.center.y;
//    CGPoint superCenter = CGPointMake(gestureView.center.x + dX, gestureView.center.y + dY);
//
//    gestureView.center = superCenter;
//
//}

@end

//    @objc func didPan(gesture: UIPanGestureRecognizer) {
//        guard let circle = gesture.view as? CircleView else {
//            return
//        }
//        if (gesture.state == .began) {
//            circle.center = gesture.location(in: self.view)
//        }
//        let newCenter: CGPoint = gesture.location(in: self.view)
//        let dX = newCenter.x - circle.center.x
//        let dY = newCenter.y - circle.center.y
//        circle.center = CGPoint(x: circle.center.x + dX, y: circle.center.y + dY)
//
//        if let outGoingCircle = circle.outGoingCircle, let line = circle.outGoingLine, let path = circle.outGoingLine?.path {
//            let newPath = UIBezierPath(cgPath: path)
//            newPath.removeAllPoints()
//            newPath.move(to: circle.center)
//            newPath.addLine(to: outGoingCircle.center)
//            line.path = newPath.cgPath
//        }
//
//        if let inComingCircle = circle.inComingCircle, let line = circle.inComingLine, let path = circle.inComingLine?.path {
//            let newPath = UIBezierPath(cgPath: path)
//            newPath.removeAllPoints()
//            newPath.move(to: inComingCircle.center)
//            newPath.addLine(to: circle.center)
//            line.path = newPath.cgPath
//        }
//    }
//    }
