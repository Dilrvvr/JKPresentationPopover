//
//  JKPresentPopoverTool.m
//  JKPresentationPopover
//
//  Created by 安永博 on 2016/12/2.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentPopoverTool.h"
#import "JKMenuViewController.h"

@implementation JKPresentPopoverTool

/**
 * 工具便捷类方法
 * popoverItems : 存放JKPresentationPopoverItem对象的数组，只要数组中有一个不是item，即不会显示
 * presentFrame : 显示的位置，相对于屏幕
 * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用
 */
+ (void)showWithPopoverItems:(NSArray *)popoverItems
                presentFrame:(CGRect)presentFrame
             didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock{
    
    [self showWithPopoverItems:popoverItems presentFrame:presentFrame viewController:nil didPresentBlock:didPresentBlock];
}

/**
 * 工具便捷类方法
 * popoverItems : 存放JKPresentationPopoverItem对象的数组，只要数组中有一个不是item，即不会显示
 * presentFrame : 显示的位置，相对于屏幕
 * viewController : 由那个控制器present出来，不传则默认根控制器
 * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用
 */
+ (void)showWithPopoverItems:(NSArray *)popoverItems
                presentFrame:(CGRect)presentFrame
              viewController:(UIViewController *)viewController
             didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock{
    
    if (popoverItems == nil || popoverItems.count <= 0) return;
    
    // 数组中只要有一个不是JKPresentationPopoverItem对象，直接返回
    for (id item in popoverItems) {
        if (![item isKindOfClass:[JKPresentationPopoverItem class]]) return;
    }
    
    JKMenuViewController *menuVc = [JKMenuViewController menuWithPopoverItems:popoverItems presentFrame:presentFrame];
    
    [menuVc setDidPresentBlock:^(BOOL isPresent) {
        !didPresentBlock ? : didPresentBlock(isPresent);
    }];
    
    if ([viewController isKindOfClass:[UIViewController class]]) {
        
        [viewController presentViewController:menuVc animated:YES completion:nil];
        
    } else {
        
        [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:menuVc animated:YES completion:nil];
    }
}
@end
