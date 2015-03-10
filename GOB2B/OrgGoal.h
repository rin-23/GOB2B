//
//  OrganizationalGoals.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrgGoal : NSObject <NSCoding>

@property (nonatomic, strong) NSString* goal;
@property (nonatomic, strong) NSString* reasons;
@property (nonatomic, strong) NSString* difficulty;
@property (nonatomic, strong) NSString* urgency;

-(void)writeToFile:(NSFileHandle*)fileHandle;

@end
