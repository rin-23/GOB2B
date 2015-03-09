//
//  GOB2BQuestions.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"

@interface GOB2BQuestions : NSObject <NSCoding>

-(NSArray*)getNextSessionQuestions;
-(void)finishedSession;

@property (nonatomic, strong) NSMutableArray* groups;

@end
