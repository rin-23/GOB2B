//
//  OrganizationalGoals.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "OrgGoal.h"

@implementation OrgGoal

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.goal forKey:@"OrgGoals_goal"];
    [aCoder encodeObject:self.reasons forKey:@"OrgGoals_reasons"];
    [aCoder encodeObject:self.difficulty forKey:@"OrgGoals_difficulty"];
    [aCoder encodeObject:self.urgency forKey:@"OrgGoals_urgency"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.goal = [aDecoder decodeObjectForKey:@"OrgGoals_goal"];
        self.reasons = [aDecoder decodeObjectForKey:@"OrgGoals_reasons"];
        self.difficulty = [aDecoder decodeObjectForKey:@"OrgGoals_difficulty"];
        self.urgency = [aDecoder decodeObjectForKey:@"OrgGoals_urgency"];
    }
    return self;
}

@end
