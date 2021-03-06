//
//  ResultsViewController.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "ResultsViewController.h"
#import "GroupResultView.h"
#import "DataFactory.h"
#import "GOB2BQuestions.h"
#import "Group.h"

@interface ResultsViewController () {
     UIScrollView* scrollView;
}

@end

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.890f green:0.890f blue:0.890f alpha:1.00f];
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"MY PROGRESS";
    headerLabel.font = [UIFont systemFontOfSize:20.0f];
    [scrollView addSubview:headerLabel];
    
    UIView* whiteLine1 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(headerLabel.frame) + 3, CGRectGetWidth(self.view.frame)-20, 3)];
    whiteLine1.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:whiteLine1];
    
    int lastY = CGRectGetMaxY(whiteLine1.frame) + 6;
    GOB2BQuestions* gQuestions  = [DataFactory getQuestionsFromCache];
    
    int kGroupNum = 6;
    for (int i = 0; i < kGroupNum; i++)
    {
        Group* group = gQuestions.groups[i];
        CGRect frame1 = CGRectMake(10, lastY, CGRectGetWidth(self.view.frame)-20, 100);
        GroupResultView* groupResult1 = [[GroupResultView alloc] initWithFrame:frame1 group:group.name subgropus:group.subgroups];
        [groupResult1 updateStateWith:group];
        [scrollView addSubview:groupResult1];
        lastY += groupResult1.frame.size.height + 3;
        
        if (i+1 != kGroupNum) {
            UIView* whiteLine = [[UIView alloc] initWithFrame:CGRectMake(10, lastY, CGRectGetWidth(self.view.frame)-20, 3)];
            whiteLine.backgroundColor = [UIColor whiteColor];
            [scrollView addSubview:whiteLine];
            
            lastY += 5;
        }
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, lastY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
