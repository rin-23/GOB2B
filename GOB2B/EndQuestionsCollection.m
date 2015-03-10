//
//  EndQuestionsCollection.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "EndQuestionsCollection.h"
#import "EndQuestion.h"

@implementation EndQuestionsCollection

-(id)init
{
    self = [super init];
    if (self) {
        self.questions = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.questions forKey:@"EndQuestionsCollection_questions"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.questions = [aDecoder decodeObjectForKey:@"EndQuestionsCollection_questions"];
    }
    return self;
}


-(void)writeToFile:(NSFileHandle*)fileHandle {
    [fileHandle writeData:[@"###END_QUESTIONS###" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    for (EndQuestion* question in self.questions) {
        [question writeToFile:fileHandle];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
