//
//  ViewController.m
//  CAShapLayer
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path moveToPoint:CGPointMake(50, 100)];
    [path addLineToPoint:CGPointMake(100, 0)];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 1.0;
    layer.strokeColor = [UIColor lightGrayColor].CGColor;
//    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
//    layer.bounds = CGPathGetBoundingBox(bound);
    
    layer.lineJoin = kCALineJoinRound;
    layer.lineCap = kCALineCapRound;
    layer.position = CGPointMake(200   , 100);
    layer.path = path.CGPath;

    [self.view.layer addSublayer:layer];
    
    
    [self drawperson];
}


-(void)drawperson {
    
        UIBezierPath *path = [UIBezierPath new];
        [path moveToPoint:CGPointMake(175, 100)];
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
        [path moveToPoint:CGPointMake(150, 125)];
        [path addLineToPoint:CGPointMake(150, 175)];
        [path addLineToPoint:CGPointMake(125, 225)];
        [path moveToPoint:CGPointMake(150, 175)];
        [path addLineToPoint:CGPointMake(175, 225)];
        [path moveToPoint:CGPointMake(100, 150)];
        [path addLineToPoint:CGPointMake(200, 150)];
    
        //create shape layer
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 5;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
