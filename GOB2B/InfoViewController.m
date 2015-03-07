//
//  InfoViewController.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-07.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController () {
    UIScrollView* scrollView;
}

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.890f green:0.890f blue:0.890f alpha:1.00f];
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    
    UITextView* textView1 = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20, 100)];
    textView1.text = @"We get to know you and your startup. We are interested in where you are on your startup journey. Still in the basement or just outside the boardroom?";
    textView1.userInteractionEnabled = NO;
    textView1.scrollEnabled = NO;
    textView1.backgroundColor = [UIColor clearColor];
    [textView1 sizeToFit]; //added
    [textView1 layoutIfNeeded]; //added
    CGRect frame = textView1.frame;
    frame.size.height = textView1.contentSize.height;
    textView1.frame = frame;
    [scrollView addSubview:textView1];

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(textView1.frame), self.view.frame.size.width-20, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"INSIGHTS";
    label.font = [UIFont systemFontOfSize:15.0f];
    [scrollView addSubview:label];
    
    UITextView* textView2 = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label.frame), self.view.frame.size.width-20, 100)];
    textView2.text = @"You ask questions, and we answer them. You rate the best answers and GOB2B is able to build a knowledge base of mentorship advice for you and your startup along the way.\n\nWe encourage users to ask questions. By asking questions we get answers to questions to help build more successful startups. You are also free to browse through questions and read answers. This helps you through advice that is relevant to your stage as a startup and your industry.";
    textView2.userInteractionEnabled = NO;
    textView2.scrollEnabled = NO;
    textView2.backgroundColor = [UIColor clearColor];
    [textView2 sizeToFit]; //added
    [textView2 layoutIfNeeded]; //added
    frame = textView2.frame;
    frame.size.height = textView2.contentSize.height;
    textView2.frame = frame;
    [scrollView addSubview:textView2];
    
    UIImageView* graphImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Graph.png"]];
    graphImageView.frame = CGRectMake(5, CGRectGetMaxY(textView2.frame)+5, self.view.frame.size.width-25, 240);
    graphImageView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:graphImageView];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(graphImageView.frame), self.view.frame.size.width-20, 30)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = @"ANALYTICS";
    label2.font = [UIFont systemFontOfSize:15.0f];
    [scrollView addSubview:label2];
    
    UITextView* textView3 = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label2.frame), self.view.frame.size.width-20, 100)];
    textView3.text = @"We ask you questions based on your stage and strategic goals as a startup. We then are able to give you a score on how you are doing against our designed framework.\n\nIf you would like more information on your startups score and how competitive you are, then for a minimal fee you can gain access to the data.\n\nThrough 6 targeted 30 second questions every Monday & Friday we measure the following metrics:\n\n1) Team - Background, Ability, Technical Capacity, Feedback Loops\n\n2) Product/Service - Functionality, Implementation, User Experience, Value Chain\n\n3) Customer Validation - Value Proposition, Evidence Quality, Demand Response, Customer Capacity\n\n4) Financials - Revenue Assumptions, Cost Assumptions, unit Economics, Financial Management\n\n5) Scale and Impact - GrowthPlan, Recurring Customers, Systmes-Level Change, Impact in the World Tied to business Model\n\n6) Return of Capital - Market Opportunity, Appropriate Capital, Investor Liquidity, Catashrophic Risks.\n\nBased on the Village Capital Enterprise Framework.";
    textView3.userInteractionEnabled = NO;
    textView3.scrollEnabled = NO;
    textView3.backgroundColor = [UIColor clearColor];
    [textView3 sizeToFit]; //added
    [textView3 layoutIfNeeded]; //added
    frame = textView3.frame;
    frame.size.height = textView3.contentSize.height;
    textView3.frame = frame;
    [scrollView addSubview:textView3];
   
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(textView3.frame), self.view.frame.size.width-20, 30)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = @"USER CASES";
    label3.font = [UIFont systemFontOfSize:15.0f];
    [scrollView addSubview:label3];
    
    UITextView* textView4 = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label3.frame), self.view.frame.size.width-20, 100)];
    textView4.text = @"I use GOB2B because it helps me keep track of the core focus areas I need to always be thinking about to be build a successful startup.\n\nI use GOB2B because it helps me compare my startup performance against other startups in the same industry\n\nI use GOB2B because it gives me predictive insights and recommendations into what I should do with my company to grow it to Fortune 500 just like the facebooks and instagram, AirBnBs and DropBox";
    textView4.userInteractionEnabled = NO;
    textView4.scrollEnabled = NO;
    textView4.backgroundColor = [UIColor clearColor];
    [textView4 sizeToFit]; //added
    [textView4 layoutIfNeeded]; //added
    frame = textView4.frame;
    frame.size.height = textView4.contentSize.height;
    textView4.frame = frame;
    [scrollView addSubview:textView4];
    
    
    UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(textView4.frame), self.view.frame.size.width-20, 30)];
    label4.backgroundColor = [UIColor clearColor];
    label4.text = @"INVESTOR";
    label4.font = [UIFont systemFontOfSize:15.0f];
    [scrollView addSubview:label4];
    
    UITextView* textView5 = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label4.frame), self.view.frame.size.width-20, 100)];
    textView5.text = @"I use GOB2B to get an overall understanding of how my startups are doing based on measurement and tracking of core insights\n\nI use GOB2B to find startups that have show strong scores in certain areas such as team, product, stage, customer validation, finances, scale & impact, return on capital so that I can invest in them or mentor them";
    textView5.userInteractionEnabled = NO;
    textView5.scrollEnabled = NO;
    textView5.backgroundColor = [UIColor clearColor];
    [textView5 sizeToFit]; //added
    [textView5 layoutIfNeeded]; //added
    frame = textView5.frame;
    frame.size.height = textView5.contentSize.height;
    textView5.frame = frame;
    [scrollView addSubview:textView5];

    
    UIImageView* rankingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ranking.png"]];
    rankingImageView.frame = CGRectMake(0, CGRectGetMaxY(textView5.frame)+10, self.view.frame.size.width, 620);

    rankingImageView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:rankingImageView];
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetMaxY(rankingImageView.frame)+10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
