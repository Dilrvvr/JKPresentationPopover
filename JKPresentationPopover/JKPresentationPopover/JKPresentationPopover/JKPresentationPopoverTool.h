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
 * configuration   : JKPresentationPopoverConfiguration
 * viewController  : 由那个控制器present出来，不传则默认根控制器
 * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用
 */
+ (void)showWithConfiguration:(JKPresentationPopoverConfiguration *)configuration
               viewController:(UIViewController *)viewController
              didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock;

/**
 * 工具便捷类方法
 * popoverItems : 存放JKPresentationPopoverItem对象的数组，只要数组中有一个不是item，即不会显示
 * presentFrame : 显示的位置，相对于屏幕
 * viewController : 由那个控制器present出来，不传则默认根控制器
 * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用

+ (void)showWithViewController:(UIViewController *)viewController
             itemConfig:(NSArray * (^)(NSMutableArray *itemArray))itemConfig
                     presentFrame:(CGRect)presentFrame
                  didPresentBlock:(void(^)(BOOL isPresent))didPresentBlock; */
@end
