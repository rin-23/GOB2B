//
//  Question.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "Question.h"

@implementation Question

-(id)init {
    self = [super init];
    if (self) {
        self.score = 0;
        self.text = @"";
        self.is7Max = 1;
    }
    return self;
}

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

-(void)writeToFile:(NSFileHandle*)fileHandle {
    if (self.score != 0)
    {
        NSString* nullStr = @"NULL";
        [fileHandle writeData:[@"###QUESTION###" dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

        if (self.text) {
            [fileHandle writeData:[self.text dataUsingEncoding:NSUTF8StringEncoding]];
        } else {
            [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
        }
        [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

        [fileHandle writeData:[[NSString stringWithFormat:@"Is 7 max: %i", self.is7Max] dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle writeData:[[NSString stringWithFormat:@"Score: %i",self.score] dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
}

-(int)getAdjustedScore
{
    if (self.score == 0) {
        return 0;
    }
    
    if (self.is7Max) {
        return self.score;
    } else {
        return 8 - self.score;
    }
}

@end
