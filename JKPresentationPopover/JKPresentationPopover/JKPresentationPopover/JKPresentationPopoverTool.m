//
//  JKPresentationPopoverTool.m
//  JKPresentationPopover
//
//  Created by 安永博 on 2016/12/2.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentationPopoverTool.h"
#import "JKPresentationPopoverViewController.h"

@implementation JKPresentationPopoverTool

/**
  * 工具便捷类方法
  * configuration   : JKPresentationPopoverConfiguration
  * viewController  : 由那个控制器present出来，不传则默认根控制器
  * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用
  */
+ (void)showWithConfiguration:(JKPresentationPopoverConfiguration *)configuration
               viewController:(UIViewController *)viewController
              didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock{
    
    if (configuration == nil || configuration.itemArray.count <= 0) return;
    
    // 数组中只要有一个不是JKPresentationPopoverItem对象，直接返回
    for (id item in configuration.itemArray) {
        
        if (![item isKindOfClass:[JKPresentationPopoverItem class]]) return;
    }
    
    JKPresentationPopoverViewController *menuVc = [JKPresentationPopoverViewController popoverWithConfiguration:configuration];
    
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
