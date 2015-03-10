//
//  OrgGoals.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrgGoalsCollection : NSObject <NSCoding>

@property (nonatomic, strong) NSMutableArray* goals;

-(void)writeToFile:(NSFileHandle*)fileHandle;

@end
