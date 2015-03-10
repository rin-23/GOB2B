//
//  QuestionFactory.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOB2BQuestions.h"
#import "EndQuestionsCollection.h"
#import "OrgGoalsCollection.h"
#import "SignUpInfo.h"

@interface DataFactory : NSObject

+(GOB2BQuestions*)createQuestionsFromBundle;
+(GOB2BQuestions*)getQuestionsFromCache;
+(BOOL)writeQuestionsToCache:(GOB2BQuestions*)gquestions;

+(OrgGoalsCollection*)getOrgGoalsCollectionFromCache;
+(BOOL)writeOrgGoalsCollectionToCache:(OrgGoalsCollection*)collection;

+(SignUpInfo*)getSignUpInfoFromCache;
+(BOOL)writeSignUpInfoToCache:(SignUpInfo*)info;

+(BOOL)isEndQuestionsCollectionInCache;
+(EndQuestionsCollection*)getEndQuestionsCollectionFromCache;
+(BOOL)writeEndQuestionsCollectionToCahce:(EndQuestionsCollection*)collection;

+(NSData*)prepareDataForMail;

@end
