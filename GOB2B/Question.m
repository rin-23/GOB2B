//
//  Question.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "Question.h"

@implementation Question

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.score forKey:@"Question_score"];
    [aCoder encodeObject:self.text forKey:@"Question_text"];
    [aCoder encodeInt:self.is7Max forKey:@"Question_is7max"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.score = [aDecoder decodeIntForKey:@"Question_score"];
        self.text = [aDecoder decodeObjectForKey:@"Question_text"];
        self.is7Max = [aDecoder decodeIntForKey:@"Question_is7max"];
    }
    return self;
}

@end
