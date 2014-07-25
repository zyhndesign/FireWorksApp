//
//  ScaleLayer.m
//  Fireworks
//
//  Created by 工业设计中意（湖南） on 14-7-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ScaleLayer.h"

@implementation ScaleLayer


-(id) init
{
    self = [super init];
    
    if (self)
    {
        scaleWidth = 2048;
    }
    
    return self;
}

-(void) drawInContext:(CGContextRef)ctx
{
    UIFont *font = [UIFont boldSystemFontOfSize:15.0];
    // Drawing lines with a white stroke color
	CGContextSetRGBStrokeColor(ctx, 0.7, 0.7, 0.7, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(ctx, 2.0);
    
    // Draw a single line from left to right
	CGContextMoveToPoint(ctx, 0.0, 30.0);
	CGContextAddLineToPoint(ctx, scaleWidth, 30.0);
	CGContextStrokePath(ctx);
    
    
    //CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    
    //CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    //CGContextFillPath(ctx);
    
    //CGContextRestoreGState(ctx);
    //CGContextSaveGState(ctx);
    
    for (int i = 0; i < scaleWidth; i = i + 10)
    {
        CGContextMoveToPoint(ctx, i, 25.0);
        CGContextAddLineToPoint(ctx, i, 30.0);
        CGContextStrokePath(ctx);
        
        if (i % 25 == 0)
        {
            CGContextMoveToPoint(ctx, i, 15.0);
            CGContextAddLineToPoint(ctx, i, 30.0);
            CGContextStrokePath(ctx);
            
            
            
        }
    }
}

@end
