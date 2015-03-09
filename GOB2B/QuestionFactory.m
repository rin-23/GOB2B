//
//  QuestionFactory.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "QuestionFactory.h"
#import "Group.h"
#import "Subgroup.h"
#import "Question.h"

@implementation QuestionFactory

+(GOB2BQuestions*)createQuestionsFromBundle
{
    GOB2BQuestions* gQuestions = [[GOB2BQuestions alloc] init];

    //check if file is saved in the bundle
    NSString* bundlePath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:bundlePath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSArray* components = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    int index = 0;
    int kNumOfTeams = 1;
    for (int i = 0; i < kNumOfTeams; ++i)
    {
        Group* group = [[Group alloc] init];;
        group.name = components[index++];
        group.curSubGroup = 0;
        for (int j = 0; j < 4; ++j)
        {
            Subgroup* subgroup = [[Subgroup alloc] init];;
            subgroup.name = components[index++];
            subgroup.curQuestion = 0;
            for (int k = 0; k < 3; ++k)
            {
                Question* question = [[Question alloc] init];
                question.text = components[index++];
                question.is7Max = [components[index++] intValue];
                question.score = 0;
                [subgroup.questions addObject:question];
            }
            [group.subgroups addObject:subgroup];
        }
        [gQuestions.groups addObject:group];
    }
    
    return gQuestions;
}


+(GOB2BQuestions*)createQuestionsFromCache
{
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"GOB2BQuestionsCache"];
    GOB2BQuestions* gQuestions = [NSKeyedUnarchiver unarchiveObjectWithFile:pathToFile];
    return gQuestions;
}

+(BOOL)writeQuestionsToCache:(GOB2BQuestions*)gquestions
{
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"GOB2BQuestionsCache"];
    return [NSKeyedArchiver archiveRootObject:gquestions toFile:pathToFile];
}



@end
