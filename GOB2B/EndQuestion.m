//
//  QuestionsData.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "EndQuestion.h"

@implementation EndQuestion

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.problem forKey:@"QuestionData_problem"];
    [aCoder encodeObject:self.reasons forKey:@"QuestionData_reasons"];
    [aCoder encodeObject:self.question forKey:@"QuestionData_question"];
    [aCoder encodeObject:self.difficulty forKey:@"QuestionData_difficulty"];
    [aCoder encodeObject:self.urgency forKey:@"QuestionData_urgency"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.problem = [aDecoder decodeObjectForKey:@"QuestionData_problem"];
        self.reasons = [aDecoder decodeObjectForKey:@"QuestionData_reasons"];
        self.question = [aDecoder decodeObjectForKey:@"QuestionData_question"];
        self.difficulty = [aDecoder decodeObjectForKey:@"QuestionData_difficulty"];
        self.urgency = [aDecoder decodeObjectForKey:@"QuestionData_urgency"];
    }
    return self;
}

-(void)writeToFile:(NSFileHandle*)fileHandle
{
    NSString* nullStr = @"NULL";

    [fileHandle writeData:[@"###END_QUESTION###" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    if (self.problem) {
        [fileHandle writeData:[self.problem dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.reasons) {
        [fileHandle writeData:[self.reasons dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.question) {
        [fileHandle writeData:[self.question dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.difficulty) {
        [fileHandle writeData:[self.difficulty dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.urgency) {
        [fileHandle writeData:[self.urgency dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
}


@end
