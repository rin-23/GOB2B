//
//  OrganizationalViewController.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-07.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "OrgGoalsViewController.h"
#include "Keys.h"
#include "OrgGoal.h"
#include "OrgGoalsCollection.h"
#include "DataFactory.h"

@interface OrgGoalsViewController () {
    UIScrollView* scrollView;
    BOOL keyboardIsShown;
    
    UITextView* textView1;
    UITextView* textView2;
    UISegmentedControl* segmentedControl1;
    UISegmentedControl* segmentedControl2;
    OrgGoalsCollection* goalsCollection;
}

@end

@implementation OrgGoalsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.890f green:0.890f blue:0.890f alpha:1.00f];
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    
    UITextView* headerText = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 100)];
    headerText.text = @"ORGANIZATIONAL GOALS";
    headerText.userInteractionEnabled = NO;
    headerText.scrollEnabled = NO;
    headerText.font = [UIFont systemFontOfSize:18.0f];
    headerText.textAlignment = NSTextAlignmentCenter;
    headerText.backgroundColor = [UIColor clearColor];
    [headerText sizeToFit]; //added
    [headerText layoutIfNeeded]; //added
    CGRect frame = headerText.frame;
    frame.size.height = headerText.contentSize.height;
    frame.size.width = self.view.frame.size.width-20;
    headerText.frame = frame;
    [scrollView addSubview:headerText];

    
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerText.frame)+10, CGRectGetWidth(self.view.frame), 45)];
    label1.text = @"Goal statement";
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:17.0f];
    label1.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label1];
    
    textView1 = [[UITextView alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(label1.frame), self.view.frame.size.width-120, 100)];
    textView1.scrollEnabled = YES;
    textView1.text = @"Customer aquisition of 5 clients in 6 months";
    textView1.layer.borderColor = [UIColor whiteColor].CGColor;
    textView1.layer.borderWidth = 2.0f;
    textView1.textColor = [UIColor lightGrayColor];
    textView1.delegate = self;
    textView1.font = [UIFont systemFontOfSize:14.0f];
    textView1.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:textView1];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textView1.frame)+10, CGRectGetWidth(self.view.frame), 45)];
    label2.text = @"Known reasons why";
    label2.backgroundColor = [UIColor clearColor];
    label2.font = [UIFont systemFontOfSize:17.0f];
    label2.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label2];
    
    textView2 = [[UITextView alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(label2.frame), self.view.frame.size.width-120, 100)];
    textView2.scrollEnabled = YES;
    textView2.delegate = self;
    textView2.text = @"To boost revenue and meet shareholder expectations for Q3";
    textView2.textColor = [UIColor lightGrayColor];
    textView2.font = [UIFont systemFontOfSize:14.0f];
    textView2.layer.borderColor = [UIColor whiteColor].CGColor;
    textView2.layer.borderWidth = 2.0f;
    textView2.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:textView2];
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textView2.frame)+10, CGRectGetWidth(self.view.frame), 45)];
    label3.text = @"Difficulty to Accomplish";
    label3.backgroundColor = [UIColor clearColor];
    label3.font = [UIFont systemFontOfSize:17.0f];
    label3.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label3];
    
    segmentedControl1 = [[UISegmentedControl alloc] initWithItems:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    segmentedControl1.frame = CGRectMake(20, CGRectGetMaxY(label3.frame), self.view.frame.size.width - 40, 35);
    segmentedControl1.tintColor = [UIColor whiteColor];
    [segmentedControl1 setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [scrollView addSubview:segmentedControl1];
    
    UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segmentedControl1.frame)+10, CGRectGetWidth(self.view.frame), 45)];
    label4.text = @"Urgency";
    label4.backgroundColor = [UIColor clearColor];
    label4.font = [UIFont systemFontOfSize:17.0f];
    label4.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label4];
    
    segmentedControl2 = [[UISegmentedControl alloc] initWithItems:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    segmentedControl2.frame = CGRectMake(20, CGRectGetMaxY(label4.frame), self.view.frame.size.width - 40, 35);
    segmentedControl2.tintColor = [UIColor whiteColor];
    [segmentedControl2 setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [scrollView addSubview:segmentedControl2];
    
    UIButton* nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [nextButton setTitle:@"List another" forState:UIControlStateNormal];
    
    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [nextButton setFrame:CGRectMake(0, 0, 130, 40)];
    nextButton.center = CGPointMake(self.view.frame.size.width/4, CGRectGetMaxY(segmentedControl2.frame) + nextButton.frame.size.height/2 + 40);
    nextButton.layer.borderColor = [UIColor whiteColor].CGColor;
    nextButton.layer.borderWidth = 2.0f;
    [nextButton addTarget:self action:@selector(listAnotherButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [cancelButton setTitle:@"Done" forState:UIControlStateNormal];
    
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [cancelButton setFrame:CGRectMake(0, 0, 130, 40)];
    cancelButton.center = CGPointMake(self.view.frame.size.width*3/4, CGRectGetMaxY(segmentedControl2.frame) + cancelButton.frame.size.height/2 + 40);
    cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
    cancelButton.layer.borderWidth = 2.0f;
    [cancelButton addTarget:self action:@selector(doneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:cancelButton];
    
    scrollView.contentSize =  CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(cancelButton.frame)+20);
    
    goalsCollection = [[OrgGoalsCollection alloc] init];
}

-(void)listAnotherButtonClicked:(UIButton*)sender
{
    OrgGoal* goal = [[OrgGoal alloc] init];
    
    goal.goal = textView1.text;
    goal.reasons = textView2.text;
    goal.difficulty = [NSString stringWithFormat:@"%i", segmentedControl1.selectedSegmentIndex+1];
    goal.urgency = [NSString stringWithFormat:@"%i", segmentedControl2.selectedSegmentIndex+1];

    [goalsCollection.goals addObject:goal];
    
    textView1.text = @"";
    textView2.text = @"";
    segmentedControl1.selectedSegmentIndex = -1;
    segmentedControl2.selectedSegmentIndex = -1;

    [scrollView setContentOffset: CGPointMake(0, -scrollView.contentInset.top) animated:YES];

    [[[UIAlertView alloc] initWithTitle:nil message:@"Goal saved" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

-(void)doneButtonClicked:(UIButton*)sender
{
    [self.view endEditing:YES];
    
    OrgGoal* goal = [[OrgGoal alloc] init];
    goal.goal = textView1.text;
    goal.reasons = textView2.text;
    goal.difficulty = [NSString stringWithFormat:@"%i", segmentedControl1.selectedSegmentIndex+1];
    goal.urgency = [NSString stringWithFormat:@"%i", segmentedControl2.selectedSegmentIndex+1];
    [goalsCollection.goals addObject:goal];
    
    
    if (![DataFactory writeOrgGoalsCollectionToCache:goalsCollection]) {
        NSLog(@"[ERROR] Didnt save data");
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Couldnt save data. Please try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    } else {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:TRUE forKey:kKeyDidSignup];
        [defaults synchronize];
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void)keyboardWillHide:(NSNotification *)n
{
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize the scrollview
    CGRect viewFrame = scrollView.frame;
    // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
    int kTabBarHeight =0 ;
    viewFrame.size.height += (keyboardSize.height - kTabBarHeight);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [scrollView setFrame:viewFrame];
    [UIView commitAnimations];
    
    keyboardIsShown = NO;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    // This is an ivar I'm using to ensure that we do not do the frame size adjustment on the `UIScrollView` if the keyboard is already shown.  This can happen if the user, after fixing editing a `UITextField`, scrolls the resized `UIScrollView` to another `UITextField` and attempts to edit the next `UITextField`.  If we were to resize the `UIScrollView` again, it would be disastrous.  NOTE: The keyboard notification will fire even when the keyboard is already shown.
    if (keyboardIsShown) {
        return;
    }
    
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize the noteView
    CGRect viewFrame = scrollView.frame;
    // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
    int kTabBarHeight = 0;
    viewFrame.size.height -= (keyboardSize.height - kTabBarHeight);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [scrollView setFrame:viewFrame];
    [UIView commitAnimations];
    keyboardIsShown = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
    keyboardIsShown = NO;
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textView.textColor == [UIColor lightGrayColor]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [scrollView setContentOffset:CGPointMake(0, CGRectGetMinY(textView.frame)-25-45) animated:YES];
}


@end
