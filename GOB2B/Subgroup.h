//
//  Subgroup.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Subgroup : NSObject <NSCoding>

@property (nonatomic, assign) int curQuestion;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* questions;

@end
