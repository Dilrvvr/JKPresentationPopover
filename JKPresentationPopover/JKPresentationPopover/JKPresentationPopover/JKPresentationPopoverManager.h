//
//  JKPresentationPopoverManager.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKPresentationPopoverManager : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
/** popover显示的frame */
@property (nonatomic, assign) CGRect presentFrame;

/** popover显示的frame */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/** 监听是否present的block */
@property (nonatomic, copy) void (^didPresentBlock)(BOOL isPresent);
@end
