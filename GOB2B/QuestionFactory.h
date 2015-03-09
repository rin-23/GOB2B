//
//  QuestionFactory.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOB2BQuestions.h"

@interface QuestionFactory : NSObject

+(GOB2BQuestions*)createQuestionsFromBundle;
+(GOB2BQuestions*)createQuestionsFromCache;
+(BOOL)writeQuestionsToCache:(GOB2BQuestions*)gquestions;

@end
