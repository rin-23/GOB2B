//
//  Question.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject <NSCoding>

@property (nonatomic, assign) int score;
@property (nonatomic, strong) NSString* text;
@property (nonatomic, assign) int is7Max;

@end
