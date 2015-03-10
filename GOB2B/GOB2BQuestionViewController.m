//
//  QuestionViewController.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "GOB2BQuestionViewController.h"
#import "Question.h"
#import "DataFactory.h"
#import "QuestionsViewController.h"

@interface GOB2BQuestionViewController () {
    GOB2BQuestions* mB2bQuestions;
    NSArray* mQuestions;
    int mQIndex;
}

@end

@implementation GOB2BQuestionViewController

-(id)initWithQuestions:(GOB2BQuestions*)gob2bQuestions
               session:(NSArray*)sessionQestions
         questionIndex:(int)qIndex
{
    self = [super init];
    if (self) {
        mB2bQuestions = gob2bQuestions;
        mQuestions = sessionQestions;
        mQIndex = qIndex;
        assert(qIndex < mQuestions.count);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.890f green:0.890f blue:0.890f alpha:1.00f];
    Question* question = mQuestions[mQIndex];
    
    UILabel* subcat = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, self.view.frame.size.width-20, 20)];
    subcat.text = question.subcat;
    subcat.backgroundColor = [UIColor clearColor];
    subcat.textAlignment = NSTextAlignmentCenter;
    subcat.font = [UIFont systemFontOfSize:18.0f];
    [self.view addSubview:subcat];
    
    UITextView* textView1 = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(subcat.frame)+5, self.view.frame.size.width-20, 200)];
    textView1.textContainerInset = UIEdgeInsetsZero;
    textView1.textContainer.lineFragmentPadding = 0;
    textView1.text = question.text;
    textView1.editable = NO;
    textView1.scrollEnabled = YES;
    textView1.selectable = NO;
    textView1.font = [UIFont systemFontOfSize:15.0f];
    textView1.textAlignment = NSTextAlignmentCenter;
    textView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:textView1];
    
    int space2 = 10;
    int size = (self.view.frame.size.height - CGRectGetMaxY(textView1.frame) -  5*space2)/4;
    int leftMargin = (self.view.frame.size.width - 2*size - 10)/2;
    
    
//    int size = size1 > size2 ? size2 : size1;
    NSMutableArray* buttons = [[NSMutableArray alloc] init];
    for (int row = 1; row <= 4; row++)
    {
        UIButton* button1 = [self createButtonWithSize:size];
        UIButton* button2 = [self createButtonWithSize:size];

        button1.center = CGPointMake(leftMargin + CGRectGetWidth(button1.frame)/2,
                                     CGRectGetMaxY(textView1.frame) + (row-1) * CGRectGetWidth(button1.frame) + CGRectGetWidth(button1.frame)/2 +  row*10);

        button2.center = CGPointMake(leftMargin + CGRectGetWidth(button1.frame) + 10 + CGRectGetWidth(button1.frame)/2 ,
                                         CGRectGetMaxY(textView1.frame) + (row-1) * CGRectGetWidth(button1.frame) + CGRectGetWidth(button1.frame)/2 +  row*10);
        

        if (row!=4)
        {
            [button1 addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button1];
            [buttons addObject:button1];
        }
        
        [self.view addSubview:button2];
        [buttons addObject:button2];
        [button2 addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self shuffle:buttons];

    for (int i = 0; i < 7; ++i)
    {
        UIButton* nextButton = buttons[i];
        [nextButton setTitle:[NSString stringWithFormat:@"%i", i+1] forState:UIControlStateNormal];
        nextButton.tag = i+1;
    }
}


- (void)shuffle:(NSMutableArray*)array
{
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [array exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

-(void)buttonSelected:(UIButton*)button {
    int score = button.tag;
    Question* question = mQuestions[mQIndex];
    question.score = score;
    
    if (mQIndex+1 == mQuestions.count) { //last question
        [mB2bQuestions finishedSession];
        if(![DataFactory writeQuestionsToCache:mB2bQuestions]) {
            NSLog(@"[ERROR] didnt save questions to cache");
        }
        QuestionsViewController* qViewController = [[QuestionsViewController alloc] init];
        [self.navigationController pushViewController:qViewController animated:YES];
        
    } else {
        GOB2BQuestionViewController* qViewController = [[GOB2BQuestionViewController alloc] initWithQuestions:mB2bQuestions session:mQuestions questionIndex:mQIndex+1];
        [self.navigationController pushViewController:qViewController animated:YES];
    }
}

-(UIButton*)createButtonWithSize:(int)size
{
    UIButton* nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setFrame:CGRectMake(0, 0, size, size)];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:20.0f];
//    [nextButton setTitle:[NSString stringWithFormat:@"%i", number] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    nextButton.layer.borderColor = [UIColor whiteColor].CGColor;
    nextButton.layer.borderWidth = 2.0f;
//    nextButton.tag = number;

    return nextButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
