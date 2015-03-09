//
//  OrgGoals.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "OrgGoalsCollection.h"

@implementation OrgGoalsCollection

-(id)init
{
    self = [super init];
    if (self) {
        self.goals = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.goals forKey:@"Org_goalarray"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.goals = [aDecoder decodeObjectForKey:@"Org_goalarray"];
    }
    return self;
}

@end
