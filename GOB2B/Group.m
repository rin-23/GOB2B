//
//  Group.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "Group.h"

@implementation Group

-(id)init{
    self = [super init];
    if (self) {
        self.subgroups = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.curSubGroup forKey:@"Group_curSubGroup"];
    [aCoder encodeObject:self.name forKey:@"Group_name"];
    [aCoder encodeObject:self.subgroups forKey:@"Group_subgropus"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.curSubGroup = [aDecoder decodeIntForKey:@"Group_curSubGroup"];
        self.name = [aDecoder decodeObjectForKey:@"Group_name"];
        self.subgroups = [aDecoder decodeObjectForKey:@"Group_subgropus"];
    }
    return self;
}

@end
