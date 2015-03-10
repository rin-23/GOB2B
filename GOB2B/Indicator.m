//
//  Indicator.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "Indicator.h"

@implementation Indicator

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        int indicatorWidth = frame.size.height/2;

        UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, indicatorWidth, indicatorWidth)];
        [view1 setBackgroundColor:[UIColor greenColor]];
        [self addSubview:view1];
        
        UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(indicatorWidth, 0, indicatorWidth, indicatorWidth)];
        [view2 setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:view2];
        
        UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(0, indicatorWidth, indicatorWidth, indicatorWidth)];
        [view3 setBackgroundColor:[UIColor redColor]];
        [self addSubview:view3];
        
        UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(indicatorWidth, indicatorWidth, indicatorWidth, indicatorWidth)];
        [view4 setBackgroundColor:[UIColor orangeColor]];
        [self addSubview:view4];

        UIView* blackFrame = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        blackFrame.layer.borderColor = [UIColor blackColor].CGColor;
        blackFrame.layer.borderWidth = 1.0f;
        [self addSubview:blackFrame];
        
        
    }
    return self;
}
@end
