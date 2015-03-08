//
//  SignupViewController.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-07.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "SignupViewController.h"
#import "GOUITextFiled.h"
#import "OrganizationalViewController.h"
#include "Keys.h"
@interface SignupViewController () {
    UIScrollView* scrollView;
    BOOL keyboardIsShown;

    
    GOUITextFiled* field1;
    GOUITextFiled* field2;
    
    GOUITextFiled* field3;
    UIPickerView* filed3Picker;
    NSArray* filed3PickerData;
    
    GOUITextFiled* field4;
    UIPickerView* filed4Picker;
    NSArray* filed4PickerData;
    
    GOUITextFiled* field5;
    GOUITextFiled* field6;
    UIPickerView* filed6Picker;
    NSArray* filed6PickerData;
    
    UISegmentedControl* segmentedControl;

    NSArray* fields;
    NSArray* keys;
}

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.890f green:0.890f blue:0.890f alpha:1.00f];
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    
    UITextView* textView1 = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 100)];
    textView1.text = @"SIGN UP\nStartup Profile Information";
    textView1.userInteractionEnabled = NO;
    textView1.scrollEnabled = NO;
    textView1.font = [UIFont systemFontOfSize:18.0f];
    textView1.textAlignment = NSTextAlignmentCenter;
    textView1.backgroundColor = [UIColor clearColor];
    [textView1 sizeToFit]; //added
    [textView1 layoutIfNeeded]; //added
    CGRect frame = textView1.frame;
    frame.size.height = textView1.contentSize.height;
    frame.size.width = self.view.frame.size.width-20;
    textView1.frame = frame;
    [scrollView addSubview:textView1];
    
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textView1.frame)+10, CGRectGetWidth(self.view.frame), 45)];
    label1.text = @"Vision";
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:17.0f];
    label1.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label1];
    
    field1 = [[GOUITextFiled alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(label1.frame), CGRectGetWidth(self.view.frame) - 80, 45)];
    field1.backgroundColor = [UIColor clearColor];
    field1.layer.borderColor = [UIColor whiteColor].CGColor;
    field1.layer.borderWidth = 2.0f;
    field1.delegate = self;
    field1.autocorrectionType = UITextAutocorrectionTypeNo;
    [scrollView addSubview:field1];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(field1.frame), CGRectGetWidth(self.view.frame), 45)];
    label2.text = @"Mission";
    label2.backgroundColor = [UIColor clearColor];
    label2.font = [UIFont systemFontOfSize:17.0f];
    label2.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label2];
    
    field2 = [[GOUITextFiled alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(label2.frame), CGRectGetWidth(self.view.frame) - 80, 45)];
    field2.backgroundColor = [UIColor clearColor];
    field2.layer.borderColor = [UIColor whiteColor].CGColor;
    field2.layer.borderWidth = 2.0f;
    field2.delegate = self;
    field2.autocorrectionType = UITextAutocorrectionTypeNo;
    [scrollView addSubview:field2];
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(field2.frame), CGRectGetWidth(self.view.frame), 45)];
    label3.text = @"Industry";
    label3.backgroundColor = [UIColor clearColor];
    label3.font = [UIFont systemFontOfSize:17.0f];
    label3.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label3];
    
    field3 = [[GOUITextFiled alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(label3.frame), CGRectGetWidth(self.view.frame) - 80, 45)];
    field3.backgroundColor = [UIColor clearColor];
    field3.layer.borderColor = [UIColor whiteColor].CGColor;
    field3.layer.borderWidth = 2.0f;
    field3.delegate = self;
    field3.autocorrectionType = UITextAutocorrectionTypeNo;
    filed3Picker = [[UIPickerView alloc] init];
    filed3Picker.dataSource = self;
    filed3Picker.delegate = self;
    field3.inputView = filed3Picker;
    filed3PickerData = @[@"Agriculture",
                   @"Advertising",
                   @"Apparel & Accessories",
                   @"Automotive",
                   @"Aviation & Aerospace",
                   @"Banking",
                   @"Broadcasting",
                   @"Biotechnology",
                   @"Beauty & Cosmetics",
                   @"Chemical",
                   @"Consulting",
                   @"Defense",
                   @"Education",
                   @"Electronics",
                   @"Energy",
                   @"Entertainment & Leisure",
                   @"Financial Services",
                   @"Food",
                   @"Health Care",
                   @"Insurance",
                   @"IT",
                   @"Media",
                   @"Legal",
                   @"Manufacturing",
                   @"Motion Picture & Video",
                   @"Music",
                   @"Pharmaceuticals",
                   @"Professional Services",
                   @"Real Estate",
                   @"Retail & Wholesale",
                   @"Software",
                   @"Sports",
                   @"Technology",
                   @"Telecommunications",
                   @"Television",
                   @"Transportation"];
    [scrollView addSubview:field3];
    
    
    UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(field3.frame), CGRectGetWidth(self.view.frame), 45)];
    label4.text = @"Incubated or Incubating";
    label4.backgroundColor = [UIColor clearColor];
    label4.font = [UIFont systemFontOfSize:17.0f];
    label4.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label4];
    
    field4 = [[GOUITextFiled alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(label4.frame), CGRectGetWidth(self.view.frame) - 80, 45)];
    field4.backgroundColor = [UIColor clearColor];
    field4.layer.borderColor = [UIColor whiteColor].CGColor;
    field4.layer.borderWidth = 2.0f;
    field4.delegate = self;
    field4.autocorrectionType = UITextAutocorrectionTypeNo;
    filed4Picker = [[UIPickerView alloc] init];
    filed4Picker.dataSource = self;
    filed4Picker.delegate = self;
    field4.inputView = filed4Picker;
    filed4PickerData = @[@"Yes", @"No"];
    [scrollView addSubview:field4];
    
    UILabel* label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(field4.frame), CGRectGetWidth(self.view.frame), 45)];
    label5.text = @"Details";
    label5.backgroundColor = [UIColor clearColor];
    label5.font = [UIFont systemFontOfSize:17.0f];
    label5.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label5];
    
    field5 = [[GOUITextFiled alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(label5.frame), CGRectGetWidth(self.view.frame) - 80, 45)];
    field5.backgroundColor = [UIColor clearColor];
    field5.layer.borderColor = [UIColor whiteColor].CGColor;
    field5.layer.borderWidth = 2.0f;
    field5.delegate = self;
    field5.autocorrectionType = UITextAutocorrectionTypeNo;
    [scrollView addSubview:field5];
    
    
    UILabel* label6 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(field5.frame), CGRectGetWidth(self.view.frame), 45)];
    label6.text = @"Role within Organization";
    label6.backgroundColor = [UIColor clearColor];
    label6.font = [UIFont systemFontOfSize:17.0f];
    label6.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label6];
    
    field6 = [[GOUITextFiled alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(label6.frame), CGRectGetWidth(self.view.frame) - 80, 45)];
    field6.backgroundColor = [UIColor clearColor];
    field6.layer.borderColor = [UIColor whiteColor].CGColor;
    field6.layer.borderWidth = 2.0f;
    field6.delegate = self;
    field6.autocorrectionType = UITextAutocorrectionTypeNo;
    filed6Picker = [[UIPickerView alloc] init];
    filed6Picker.dataSource = self;
    filed6Picker.delegate = self;
    field6.inputView = filed6Picker;
    filed6PickerData = @[@"Account Management and Customer Service",
                         @"Business Development",
                         @"Marketing",
                         @"Office Managers",
                         @"The Engineer",
                         @"The Product Person",
                         @"The Sales Person"];
    [scrollView addSubview:field6];

    UILabel* label7 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(field6.frame), CGRectGetWidth(self.view.frame), 45)];
    label7.text = @"Stage";
    label7.backgroundColor = [UIColor clearColor];
    label7.font = [UIFont systemFontOfSize:17.0f];
    label7.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:label7];

    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    segmentedControl.frame = CGRectMake(20, CGRectGetMaxY(label7.frame), self.view.frame.size.width - 40, 35);
    segmentedControl.tintColor = [UIColor whiteColor];
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [scrollView addSubview:segmentedControl];
    
    UILabel* segLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(segmentedControl.frame), 100, 45)];
    segLabel1.text = @"Early";
    segLabel1.backgroundColor = [UIColor clearColor];
    segLabel1.font = [UIFont systemFontOfSize:13.0f];
    segLabel1.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:segLabel1];

    
    UILabel* segLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segmentedControl.frame), 100, 45)];
    segLabel2.text = @"Mid";
    segLabel2.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMaxY(segmentedControl.frame) + segLabel2.frame.size.height/2);
    segLabel2.backgroundColor = [UIColor clearColor];
    segLabel2.font = [UIFont systemFontOfSize:13.0f];
    segLabel2.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:segLabel2];
    
    UILabel* segLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-120, CGRectGetMaxY(segmentedControl.frame), 100, 45)];
    segLabel3.text = @"Fortune 500";
    segLabel3.backgroundColor = [UIColor clearColor];
    segLabel3.font = [UIFont systemFontOfSize:13.0f];
    segLabel3.textAlignment = NSTextAlignmentRight;
    [scrollView addSubview:segLabel3];
    
    
    UIButton* nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [nextButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    
    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [nextButton setFrame:CGRectMake(0, 0, 130, 40)];
    nextButton.center = CGPointMake(self.view.frame.size.width/4, CGRectGetMaxY(segLabel3.frame) + nextButton.frame.size.height/2 + 40);
    nextButton.layer.borderColor = [UIColor whiteColor].CGColor;
    nextButton.layer.borderWidth = 2.0f;
    [nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [cancelButton setFrame:CGRectMake(0, 0, 130, 40)];
    cancelButton.center = CGPointMake(self.view.frame.size.width*3/4, CGRectGetMaxY(segLabel3.frame) + cancelButton.frame.size.height/2 + 40);
    cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
    cancelButton.layer.borderWidth = 2.0f;
    [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:cancelButton];
    
    //plus Stage
    fields = @[field1,field2,field3,field4,field5,field6];
    keys = @[kKeyVision, kKeyMission, kKeyIndustry, kKeyIncubated, kKeyDetails, kKeyRoleOrganization];
    
    scrollView.contentSize =  CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(nextButton.frame)+20);
}

-(void)nextButtonClicked:(UIButton*)sender {
    [self.view endEditing:YES];
    self.view.userInteractionEnabled = NO;
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//
//    for (int i = 0; i < fields.count; ++i)
//    {
//        UITextField* textField = fields[i];
//        NSString* key = keys[i];
//        if ([key isEqualToString:kKeyDetails]) {
//            //ignore details field
//            continue;
//        }
//        
//        if ([textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
//        {
//            self.view.userInteractionEnabled = YES;
//            [[[UIAlertView alloc] initWithTitle:nil message:@"Some information is missing" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
//            return;
//        }
//    }

    
    for (int i = 0; i < keys.count; ++i)
    {
        UITextField* textField = fields[i];
        NSString* key = keys[i];
        [defaults setObject:textField.text forKey:key];
    }
    
    int index = [segmentedControl selectedSegmentIndex];
    [defaults setObject:[NSString stringWithFormat:@"%i", index+1] forKey:kKeyStage];

    if (![defaults synchronize]) {
        NSLog(@"[ERROR] Didnt save data");
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Couldnt save data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }

    self.view.userInteractionEnabled = YES;
    OrganizationalViewController* org = [[OrganizationalViewController alloc] init];
    [self.navigationController pushViewController:org animated:YES];
}

-(void)cancelButtonClicked:(UIButton*)sender {
    [self.view endEditing:YES];
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


#pragma mark - Picker delegate 
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == filed3Picker) {
        return filed3PickerData.count;
    } else if (pickerView == filed4Picker) {
        return filed4PickerData.count;
    } else if (pickerView == filed6Picker) {
        return filed6PickerData.count;
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == filed3Picker) {
        return filed3PickerData[row];
    } else if (pickerView == filed4Picker) {
        return filed4PickerData[row];
    } else if (pickerView == filed6Picker) {
        return filed6PickerData[row];
    }
    return @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == filed3Picker) {
        field3.text = filed3PickerData[row];
    } else if (pickerView == filed4Picker) {
        field4.text = filed4PickerData[row];
    } else if (pickerView == filed6Picker) {
        field6.text = filed6PickerData[row];
    }
}

@end
