//
//  SignUpInfo.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "SignUpInfo.h"

@implementation SignUpInfo

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.vision forKey:@"SignupInfo_vision"];
    [aCoder encodeObject:self.mission forKey:@"SignupInfo_mission"];
    [aCoder encodeObject:self.industry forKey:@"SignupInfo_industry"];
    [aCoder encodeObject:self.incubated forKey:@"SignupInfo_incubated"];
    [aCoder encodeObject:self.details forKey:@"SignupInfo_details"];
    [aCoder encodeObject:self.role forKey:@"SignupInfo_role"];
    [aCoder encodeObject:self.stage forKey:@"SignupInfo_stage"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.vision = [aDecoder decodeObjectForKey:@"SignupInfo_vision"];
        self.mission = [aDecoder decodeObjectForKey:@"SignupInfo_mission"];
        self.industry = [aDecoder decodeObjectForKey:@"SignupInfo_industry"];
        self.incubated = [aDecoder decodeObjectForKey:@"SignupInfo_incubated"];
        self.details = [aDecoder decodeObjectForKey:@"SignupInfo_details"];
        self.role = [aDecoder decodeObjectForKey:@"SignupInfo_role"];
        self.stage = [aDecoder decodeObjectForKey:@"SignupInfo_stage"];
    }
    return self;
}

-(void)writeToFile:(NSFileHandle*)fileHandle
{
    NSString* nullStr = @"NULL";

    [fileHandle writeData:[@"###SIGNUP###" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.vision) {
        [fileHandle writeData:[self.vision dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.mission) {
        [fileHandle writeData:[self.mission dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

    if (self.industry) {
        [fileHandle writeData:[self.industry dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

    if (self.incubated) {
        [fileHandle writeData:[self.incubated dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

    if (self.details) {
        [fileHandle writeData:[self.details dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

    if (self.role) {
        [fileHandle writeData:[self.role dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (self.stage) {
        [fileHandle writeData:[self.stage dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [fileHandle writeData:[nullStr dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle writeData:[@"\n\n" dataUsingEncoding:NSUTF8StringEncoding]];

}

@end
