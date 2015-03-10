//
//  StartupViewController.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-07.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "StartupViewController.h"
#import "InfoViewController.h"
#import "SignupViewController.h"
#include "Keys.h"
#include "GOB2BQuestionViewController.h"
#include "GOB2BQuestions.h"
#include "DataFactory.h"
#include "ResultsViewController.h"

@interface StartupViewController ()
{
    UIButton* signupButton;
    UIButton* beginButton;
    UIButton* viewButton;
}

@end

@implementation StartupViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"Stairs.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];

    UIImageView* gob2blogo =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 60)];
    gob2blogo.center = CGPointMake(self.view.frame.size.width/2, 0.4f * self.view.frame.size.height);
    gob2blogo.image = [UIImage imageNamed:@"GOB2B Logo (white).png"];
    gob2blogo.contentMode = UIViewContentModeScaleAspectFit;
    gob2blogo.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:gob2blogo];
    
    
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 70)];
    textView.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMaxY(gob2blogo.frame) + CGRectGetHeight(textView.frame)/2 + 30);
    textView.backgroundColor = [UIColor clearColor];
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"HelveticaNeue-Italic" size:14.0f];
    textView.userInteractionEnabled = NO;
    textView.textAlignment = NSTextAlignmentCenter;
    textView.textColor = [UIColor whiteColor];
    textView.text = @"Basement to boardroom insight and analytics to take your company from early stage to fortune 500";
    [self.view addSubview:textView];
    
    signupButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signupButton.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    [signupButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    
    [signupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signupButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [signupButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [signupButton setFrame:CGRectMake(0, 0, 150, 50)];
    signupButton.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMaxY(textView.frame) + signupButton.frame.size.height/2 + 10);
    signupButton.layer.borderColor = [UIColor whiteColor].CGColor;
    signupButton.layer.borderWidth = 2.0f;
    [signupButton addTarget:self action:@selector(signupButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signupButton];

    beginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    beginButton.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    [beginButton setTitle:@"Begin" forState:UIControlStateNormal];

    [beginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [beginButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [beginButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [beginButton setFrame:CGRectMake(0, 0, 150, 50)];
    beginButton.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMaxY(textView.frame) + beginButton.frame.size.height/2 + 10);
    beginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    beginButton.layer.borderWidth = 2.0f;
    [beginButton addTarget:self action:@selector(beginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginButton];
    
    viewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    viewButton.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    [viewButton setTitle:@"View" forState:UIControlStateNormal];
    
    [viewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [viewButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [viewButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [viewButton setFrame:CGRectMake(0, 0, 150, 50)];
    viewButton.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMaxY(beginButton.frame) + viewButton.frame.size.height/2 + 14);
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 2.0f;
    [viewButton addTarget:self action:@selector(viewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewButton];
    
    UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton setFrame:CGRectMake(0,0,30,30)];
    infoButton.center = CGPointMake(30, self.view.frame.size.height -30);
    [infoButton addTarget:self action:@selector(infoButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kKeyDidSignup])
    {
        signupButton.hidden = NO;
        beginButton.hidden = YES;
        viewButton.hidden = YES;
    }
    else
    {
        signupButton.hidden = YES;
        beginButton.hidden = NO;
        viewButton.hidden = NO;
    }
}

-(void)beginButtonClicked:(UIButton*)sender
{
    GOB2BQuestions* questions = [DataFactory getQuestionsFromCache];
    NSArray* sessionQuestions =  [questions getNextSessionQuestions];
    int qIndex = 0;
    GOB2BQuestionViewController* qViewController = [[GOB2BQuestionViewController alloc] initWithQuestions:questions session:sessionQuestions questionIndex:qIndex];
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:qViewController];
    navController.navigationBarHidden = YES;
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:navController animated:YES completion:nil];
}

-(void)beginButtonClickedDown:(UIButton*)sender
{
//    sender.layer.borderColor = [UIColor grayColor].CGColor;
}

-(void)signupButtonClicked:(UIButton*)sender
{
//    sender.layer.borderColor = [UIColor whiteColor].CGColor;
    SignupViewController* infoVC = [[SignupViewController alloc] init];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:infoVC];
    navVC.navigationBarHidden = YES;
    navVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [infoVC.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissInfoModalController:)]];
    [self presentViewController:navVC animated:YES completion:nil];
}

-(void)viewButtonClicked:(UIButton*)sender
{
    ResultsViewController* resultsVC = [[ResultsViewController alloc] init];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:resultsVC];
    navVC.navigationBarHidden = NO;
    navVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [resultsVC.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissInfoModalController:)]];
    
    [self presentViewController:navVC animated:YES completion:nil];
}

-(void)infoButtonClicked:(UIButton*)sender
{
    InfoViewController* infoVC = [[InfoViewController alloc] init];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:infoVC];
    navVC.navigationBarHidden = NO;
    navVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [infoVC.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissInfoModalController:)]];
    [self presentViewController:navVC animated:YES completion:nil];
}

-(void)dismissInfoModalController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
