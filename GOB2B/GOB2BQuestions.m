//
//  GOB2BQuestions.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "GOB2BQuestions.h"
#import "Subgroup.h"
#import "Question.h"
#import "DataFactory.h"

@implementation GOB2BQuestions

-(id)init {
    self = [super init];
    if (self) {
        self.groups = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray*)getNextSessionQuestions
{
    NSMutableArray* nextQuestions = [[NSMutableArray alloc] init];
    for (Group* group in self.groups)
    {
        //Dont change values if curSubGroup and curQuestions before user finishes session. In case he quits in the middle.
        
        int subGroup1 = group.curSubGroup;
        int subGroup2 = (group.curSubGroup + 1) % 4;
        Subgroup* nextSubgroup1 = group.subgroups[subGroup1];
        Subgroup* nextSubgroup2 = group.subgroups[subGroup2];
        
        Question* question1 = nextSubgroup1.questions[nextSubgroup1.curQuestion];
        Question* question2 = nextSubgroup2.questions[nextSubgroup2.curQuestion];

        [nextQuestions addObject:question1];
        [nextQuestions addObject:question2];
    }
    
    return nextQuestions;
}

-(void)finishedSession
{
    for (Group* group in self.groups)
    {
        //User finished sessions so change values now
        
        Subgroup* nextSubgroup1 = group.subgroups[group.curSubGroup];
        group.curSubGroup = (group.curSubGroup + 1) % 4;
        
        Subgroup* nextSubgroup2 = group.subgroups[group.curSubGroup];
        group.curSubGroup = (group.curSubGroup + 1) % 4;
        
        nextSubgroup1.curQuestion = (nextSubgroup1.curQuestion + 1) % 12;
        nextSubgroup2.curQuestion = (nextSubgroup2.curQuestion + 1) % 12;
    }
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.groups forKey:@"GOB2BQuestions_groups"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.groups = [aDecoder decodeObjectForKey:@"GOB2BQuestions_groups"];
    }
    return self;
}

-(void)writeToFile:(NSFileHandle*)fileHandle
{
    [fileHandle writeData:[@"###GOB2B QUESTIONS###" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    for (Group* group in self.groups)
    {
        [group writeToFile:fileHandle];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
