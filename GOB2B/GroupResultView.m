//
//  GroupResultView.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "GroupResultView.h"
#import "Indicator.h"
#import "Subgroup.h"
#import "Question.h"

@implementation GroupResultView

-(id)initWithFrame:(CGRect)frame group:(NSString*)groupName subgropus:(NSMutableArray*)subgroups
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UILabel* groupLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        groupLabel.backgroundColor = [UIColor clearColor];
        groupLabel.font = [UIFont systemFontOfSize:17.0f];
        groupLabel.textAlignment = NSTextAlignmentLeft;
        groupLabel.text = [groupName uppercaseString];
        [self addSubview:groupLabel];

        int size = (frame.size.height - groupLabel.frame.size.height - 5*3)/4;
        
        int lastY = CGRectGetMaxY(groupLabel.frame)+3;
        mIndicators = [[NSMutableArray alloc] initWithCapacity:4];
        for (int i = 0; i < 4; i++)
        {
            UIView* indicator = [[UIView alloc] initWithFrame:CGRectMake(0, lastY, size, size)];
            indicator.backgroundColor = [UIColor clearColor];
            indicator.layer.borderColor = [UIColor blackColor].CGColor;
            indicator.layer.borderWidth = 1.0f;
            [mIndicators addObject:indicator];
            [self addSubview:indicator];
        
            UILabel* subgroup1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(indicator.frame) + 4, lastY, 200, size)];
            Subgroup* sub = subgroups[i];
            subgroup1.text = sub.name;
            subgroup1.font = [UIFont systemFontOfSize:13.0f];
            [self addSubview:subgroup1];

            lastY += indicator.frame.size.width + 3;
        }
        
//        lastY = self.frame.size.height - groupLabel.frame.size.height -3 - 10;
        mTotalIndicator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        mTotalIndicator.center = CGPointMake(self.frame.size.width - 35, CGRectGetMaxY(groupLabel.frame) + 3 + 35);
        mTotalIndicator.layer.borderWidth = 1.0f;
        mTotalIndicator.layer.borderColor = [UIColor blackColor].CGColor;
        mTotalIndicator.backgroundColor = [UIColor clearColor];
        [self addSubview:mTotalIndicator];
    }
    return self;
}

-(void)updateStateWith:(Group*) group
{
    float totalAvg = 0.0f;
    int totalAvgCount = 0;
    for (int i = 0; i < group.subgroups.count; i++)
    {
        Subgroup* sub = group.subgroups[i];
        int count = 0;
        float sum = 0.0f;
        for (Question* question in sub.questions)
        {
            if (question.score!=0) {
                sum+= [question getAdjustedScore];
                count++;
            }
        }
        
        float avg = sum/count;
        if (avg>0.0f) {
            totalAvg += avg;
            totalAvgCount++;
        }
        
        UIView* indicator = mIndicators[i];
        if (avg > 0.0f && avg <= 1.75f) {
            indicator.backgroundColor = [UIColor redColor];
        } else if (avg > 1.75f && avg <= 3.5f) {
            indicator.backgroundColor = [UIColor orangeColor];
        } else if (avg > 3.5f && avg <=5.25f) {
            indicator.backgroundColor = [UIColor yellowColor];
        } else if (avg > 5.25f && avg <=7.0f) {
            indicator.backgroundColor = [UIColor greenColor];
        } else {
            indicator.backgroundColor = [UIColor clearColor];
        }
    }

    totalAvg /= totalAvgCount;
    if (totalAvg > 0.0f && totalAvg <= 1.75f) {
        mTotalIndicator.backgroundColor = [UIColor redColor];
    } else if (totalAvg > 1.75f && totalAvg <= 3.5f) {
        mTotalIndicator.backgroundColor = [UIColor orangeColor];
    } else if (totalAvg > 3.5f && totalAvg <=5.25f) {
        mTotalIndicator.backgroundColor = [UIColor yellowColor];
    } else if (totalAvg > 5.25f && totalAvg <=7.0f) {
        mTotalIndicator.backgroundColor = [UIColor greenColor];
    } else {
        mTotalIndicator.backgroundColor = [UIColor clearColor];
    }

}

@end
