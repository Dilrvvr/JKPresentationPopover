//
//  JKPresentationPopoverTool.h
//  JKPresentationPopover
//
//  Created by 安永博 on 2016/12/2.
//  Copyright © 2016年 albert. All rights reserved.
//  工具类

#import <UIKit/UIKit.h>
#import "JKPresentationPopoverItem.h"
#import "JKPresentationPopoverConfiguration.h"

@interface JKPresentationPopoverTool : NSObject

/** 监听是否present的block */
@property (nonatomic, copy) void (^didPresentBlock)(BOOL isPresent);

/**
 * 工具便捷类方法
 * configuration   : 返回一个JKPresentationPopoverConfiguration
 * viewController  : 由那个控制器present出来，不传则默认根控制器
 * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用
 */
+ (void)showWithConfiguration:(void (^)(JKPresentationPopoverConfiguration *configuration))configuration
               viewController:(UIViewController *)viewController
              didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock;
@end
