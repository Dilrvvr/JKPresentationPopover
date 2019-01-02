//
//  JKPresentationPopoverTransitionManager.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKPresentationPopoverConst.h"

@interface JKPresentationPopoverTransitionManager : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

/** popover显示的frame */
@property (nonatomic, assign) CGRect presentFrame;

/** popover显示的frame */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/** 动画方向 */
@property (nonatomic, assign) JKPresentPopoverAnimationDirection animationDirection;

/** 默认黑色0.3透明度 */
@property (nonatomic, strong) UIColor *presentBackGroundColor;

/** 监听是否present的block */
@property (nonatomic, copy) void (^didPresentBlock)(BOOL isPresent);
@end
