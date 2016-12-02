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
+ (void)showWithPopoverItems:(NSArray *)popoverItems presentFrame:(CGRect)presentFrame didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock{
    
    if (popoverItems == nil || popoverItems.count <= 0) return;
    
    // 数组中只要有一个不是JKPresentationPopoverItem对象，直接返回
    for (id item in popoverItems) {
        if (![item isKindOfClass:[JKPresentationPopoverItem class]]) return;
    }
    
    JKMenuViewController *menuVc = [JKMenuViewController menuWithPopoverItems:popoverItems presentFrame:presentFrame];
    
    [menuVc setDidPresentBlock:^(BOOL isPresent) {
        !didPresentBlock ? : didPresentBlock(isPresent);
    }];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:menuVc animated:YES completion:nil];
}
@end
