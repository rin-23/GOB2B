//
//  Subgroup.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "Subgroup.h"

@implementation Subgroup

-(id)init {
    self = [super init];
    if (self) {
        self.questions = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.curQuestion forKey:@"Subgroup_curQuestion"];
    [aCoder encodeObject:self.name forKey:@"Subgroup_name"];
    [aCoder encodeObject:self.questions forKey:@"Subgroup_questions"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.curQuestion =[aDecoder decodeIntForKey:@"Subgroup_curQuestion"];
        self.name = [aDecoder decodeObjectForKey:@"Subgroup_name"];
        self.questions = [aDecoder decodeObjectForKey:@"Subgroup_questions"];
    }
    return self;
}

@end
