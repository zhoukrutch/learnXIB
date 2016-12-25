//
//  MyViewByDraw.m
//  Quartz2D
//
//  Created by tao on 16/8/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "MyViewByDraw.h"

@implementation MyViewByDraw


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rt = CGRectMake(50, 200, 200, 200);
    CGContextAddEllipseInRect(context, rt);
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
}


@end
