//
//  SplitLine.m
//  Fireworks
//
//  Created by 工业设计中意（湖南） on 14-7-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "SplitLine.h"

@implementation SplitLine

-(void) drawInContext:(CGContextRef)ctx
{
    CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 1.0, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(ctx, 2.0);
    
    // Draw a single line from left to right
	CGContextMoveToPoint(ctx, 30.0, 10.0);
	CGContextAddLineToPoint(ctx, 30, 300.0);
	CGContextStrokePath(ctx);

}
@end
