//
//  GroupResultView.h
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-09.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface GroupResultView : UIView {
    NSMutableArray* mIndicators;
    UIView* mTotalIndicator;
}

-(id)initWithFrame:(CGRect)frame group:(NSString*)group subgropus:(NSMutableArray*)subgroups;
-(void)updateStateWith:(Group*) group;

@end
