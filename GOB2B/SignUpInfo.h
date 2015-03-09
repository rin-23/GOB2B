//
//  SignUpInfo.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-08.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpInfo : NSObject <NSCoding>

@property (nonatomic, strong) NSString* vision;
@property (nonatomic, strong) NSString* mission;
@property (nonatomic, strong) NSString* industry;
@property (nonatomic, strong) NSString* incubated;
@property (nonatomic, strong) NSString* details;
@property (nonatomic, strong) NSString* role;
@property (nonatomic, strong) NSString* stage;

@end
