//
//  UIViewController+HCPushBackAnimation.h
//  PushBackAnimation
//
//  Created by 김형철 on 13. 2. 22..
//  Copyright (c) 2013년 Tictoc Planet, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HCPushBackAnimation)
@property (assign, nonatomic) BOOL pushBackState;

// sample1
-(void) animationPopFront;
-(void) animationPushBack;

// sample2
-(void) animationPopFrontScaleUp;
-(void) animationPushBackScaleDown;

// TODO
-(void) animationPushBackLikeGmail;
-(void) animationPopFrontLikeGmail;

// TODO some animations...
@end