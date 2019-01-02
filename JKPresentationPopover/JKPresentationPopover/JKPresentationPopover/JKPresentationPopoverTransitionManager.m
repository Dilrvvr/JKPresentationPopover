//
//  JKPresentationPopoverTransitionManager.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentationPopoverTransitionManager.h"
#import "JKPresentationPopoverController.h"

@interface JKPresentationPopoverTransitionManager ()

/** 是否已经被present */
@property (nonatomic, assign) BOOL isPresent;

/** dismissButton */
@property (nonatomic, weak) UIButton *dismissButton;
@end

@implementation JKPresentationPopoverTransitionManager

- (instancetype)init{
    if (self = [super init]) {
        _presentBackGroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
    return self;
}

#pragma mark
#pragma mark - UIViewControllerTransitioningDelegate

// 该方法返回一个负责转场动画的对象
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    JKPresentationPopoverController *pc = [[JKPresentationPopoverController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
    pc.presentFrame = self.presentFrame;
    
    return pc;
}

// 该方法用于返回一个负责转场如何出现的对象
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    self.isPresent = YES;
    
    !self.didPresentBlock ? : self.didPresentBlock(self.isPresent);
    
    //self要遵守UIViewControllerAnimatedTransitioning协议，并实现对应方法
    return self;
}

// 该方法用于返回一个负责转场如何消失的对象
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    self.isPresent = NO;
    
    !self.didPresentBlock ? : self.didPresentBlock(self.isPresent);
    
    //self要遵守UIViewControllerAnimatedTransitioning协议，并实现对应方法
    return self;
}

#pragma mark
#pragma mark - UIViewControllerAnimatedTransitioning协议方法

// 告诉系统展现和消失的动画时长。在这里统一控制动画时长
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return self.animationDuration;
}

// 专门用于管理modal如何展现和消失的，无论是展现还是消失都会调用该方法
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    if (self.isPresent) {// 展现
        
        [self willPresentController:transitionContext];
        
    }else {//消失
        
        [self willDismissController:transitionContext];
    }
}

#pragma mark
#pragma mark - 执行展现的动画

- (void)willPresentController:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 1.获取要弹出的视图
    // 通过ToViewKey取出来的就是toVc对应的view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    if (toView == nil) return;
    
    // 2.将需要弹出的视图添加到containerView上
    [[transitionContext containerView] addSubview:toView];
    
    // 3.执行动画
    
    // 默认动画是从中间慢慢放大的，这是因为图层默认的锚点是(0.5，0.5)
    
    switch (self.animationDirection) {
        case JKPresentPopoverAnimationDirectionTopToBottom:
        {
            toView.layer.anchorPoint = CGPointMake(0.5, 0);
            toView.transform = CGAffineTransformMakeScale(1, 0);
        }
            break;
        case JKPresentPopoverAnimationDirectionLeftToRight:
        {
            toView.layer.anchorPoint = CGPointMake(0, 0.5);
            toView.transform = CGAffineTransformMakeScale(0, 1);
        }
            break;
        case JKPresentPopoverAnimationDirectionBottomToTop:
        {
            toView.layer.anchorPoint = CGPointMake(0.5, 1);
            toView.transform = CGAffineTransformMakeScale(1, 0);
        }
            break;
        case JKPresentPopoverAnimationDirectionRightToLeft:
        {
            toView.layer.anchorPoint = CGPointMake(1, 0.5);
            toView.transform = CGAffineTransformMakeScale(0, 1);
        }
            break;
            
        default:
            break;
    }
    
    transitionContext.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform = CGAffineTransformIdentity;
        
        transitionContext.containerView.backgroundColor = self.presentBackGroundColor;
        
    } completion:^(BOOL finished) {
        
        // 注意：自定义转场动画，在执行完动画之后一定要告诉系统动画执行完毕了！！
        [transitionContext completeTransition:YES];
    }];
}

#pragma mark
#pragma mark - 执行消失的动画

- (void)willDismissController:(id<UIViewControllerContextTransitioning>)transitionContext{
   
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    if (fromView == nil) return;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        switch (self.animationDirection) {
            case JKPresentPopoverAnimationDirectionTopToBottom:
            case JKPresentPopoverAnimationDirectionBottomToTop:
            {
                fromView.transform = CGAffineTransformMakeScale(1, 0.0001);
            }
                break;
            case JKPresentPopoverAnimationDirectionLeftToRight:
            case JKPresentPopoverAnimationDirectionRightToLeft:
            {
                fromView.transform = CGAffineTransformMakeScale(0.0001, 1);
            }
                break;
                
            default:
                break;
        }
        
        transitionContext.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        
    } completion:^(BOOL finished) {
        
        // 注意：自定义转场动画，在执行完动画之后一定要告诉系统动画执行完毕了！！
        [transitionContext completeTransition:YES];
    }];
}
@end
