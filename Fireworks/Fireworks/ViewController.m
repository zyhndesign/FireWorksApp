//
//  ViewController.m
//  Fireworks
//
//  Created by 工业设计中意（湖南） on 14-7-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ViewController.h"
#import "layers/ScaleLayer.h"
#import "layers/SplitLine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100,1024, 300)];
    scrollView.scrollEnabled = YES;
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.showsHorizontalScrollIndicator = YES;
    //scrollView.alwaysBounceHorizontal = YES;
    scrollView.contentSize = CGSizeMake(2048, 300);
    [self.view addSubview:scrollView];
    
    ScaleLayer *scaleLayer = [ScaleLayer layer];
    
    scaleLayer.backgroundColor = [UIColor blackColor].CGColor;
    scaleLayer.bounds = CGRectMake(0, 0, 2048, 300);
    scaleLayer.anchorPoint = CGPointZero;
    scaleLayer.position = CGPointMake(0, 0);
    scaleLayer.shadowColor = [UIColor blackColor].CGColor;
    scaleLayer.shadowOpacity = 0.6;
    [scaleLayer setNeedsDisplay];
    [scrollView.layer addSublayer:scaleLayer];
    
    SplitLine *splitLine = [SplitLine layer];
    splitLine.bounds = CGRectMake(0, 0, 60, 300);
    splitLine.anchorPoint = CGPointZero;
    splitLine.position = CGPointMake(0, 0);
    splitLine.shadowColor = [UIColor blackColor].CGColor;
    splitLine.shadowOpacity = 0.6;
    [splitLine setNeedsDisplay];
    [scrollView.layer addSublayer:splitLine];
    
    splitView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 300)];
    [splitView.layer addSublayer:splitLine];
    [scrollView addSubview:splitView];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [splitView addGestureRecognizer:panGestureRecognizer];
}

-(void) handlePan:(UIPanGestureRecognizer *)rec
{
    if (rec.state == UIGestureRecognizerStateChanged)
    {
        CGPoint offset = [rec translationInView:splitView];
        [splitView setCenter:CGPointMake(splitView.center.x + offset.x, splitView.center.y)];
        [rec setTranslation:CGPointMake(0, 0) inView:splitView];
    }
    
    if (rec.state == UIGestureRecognizerStateEnded)
    {
        CGPoint offset = [rec translationInView:splitView];
        int xAxisValue = splitView.center.x + offset.x;
        
        if ((xAxisValue % 10) > 5)
        {
            xAxisValue = xAxisValue / 10 * 10 + 10;
        }
        else
        {
            xAxisValue = xAxisValue / 10 * 10;
        }
        [splitView setCenter:CGPointMake(xAxisValue, splitView.center.y)];
        [rec setTranslation:CGPointMake(0, 0) inView:splitView];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
