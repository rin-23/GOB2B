//
//  EndQuestionsCollection.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "EndQuestionsCollection.h"

@implementation EndQuestionsCollection

-(id)init
{
    self = [super init];
    if (self) {
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

@end
