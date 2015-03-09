//
//  QuestionViewController.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOB2BQuestionViewController : UIViewController

-(id)initWithQuestions:(NSArray*)questions scores:(int*)scores questionIndex:(int)qIndex;


@end
