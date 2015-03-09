//
//  QuestionFactory.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "DataFactory.h"
#import "Group.h"
#import "Subgroup.h"
#import "Question.h"

@implementation DataFactory

#pragma mark - GOB2BQuestions

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


+(GOB2BQuestions*)getQuestionsFromCache
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
    BOOL result = [NSKeyedArchiver archiveRootObject:gquestions toFile:pathToFile];
    return result;
}

#pragma mark - Org Goals Collection

+(OrgGoalsCollection*)getOrgGoalsCollectionFromCache
{   
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"OrgGoalsCollection"];
    OrgGoalsCollection* collection = [NSKeyedUnarchiver unarchiveObjectWithFile:pathToFile];
    return collection;
}

+(BOOL)writeOrgGoalsCollectionToCache:(OrgGoalsCollection*)collection
{
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"OrgGoalsCollection"];
    BOOL result = [NSKeyedArchiver archiveRootObject:collection toFile:pathToFile];
    return result;
}

#pragma mark - Signup info

+(SignUpInfo*)getSignUpInfoFromCache
{
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"SignUpInfo"];
    SignUpInfo* info = [NSKeyedUnarchiver unarchiveObjectWithFile:pathToFile];
    return info;
}

+(BOOL)writeSignUpInfoToCache:(SignUpInfo*)info
{
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"SignUpInfo"];
    BOOL result = [NSKeyedArchiver archiveRootObject:info toFile:pathToFile];
    return result;
}

#pragma mark - End Questions Collection

+(EndQuestionsCollection*)getEndQuestionsCollectionFromCache {
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"EndQuestionsCollection"];
    EndQuestionsCollection* collection = [NSKeyedUnarchiver unarchiveObjectWithFile:pathToFile];
    return collection;
}

+(BOOL)writeEndQuestionsCollectionToCahce:(EndQuestionsCollection*)collection {
    NSString* cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* pathToFile = [NSString stringWithFormat:@"%@/%@", cacheFolder, @"EndQuestionsCollection"];
    BOOL result = [NSKeyedArchiver archiveRootObject:collection toFile:pathToFile];
    return result;
}


@end
