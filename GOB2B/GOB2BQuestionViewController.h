//
//  QuestionViewController.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOB2BQuestions.h"

@interface GOB2BQuestionViewController : UIViewController

-(id)initWithQuestions:(GOB2BQuestions*)gob2bQuestions
               session:(NSArray*)sessionQestions 
         questionIndex:(int)qIndex;


@end
