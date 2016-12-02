//
//  JKMenuViewController.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKPresentationPopoverManager, JKPresentationPopoverItem;

@interface JKMenuViewController : UIViewController

/** 监听是否present的block */
@property (nonatomic, copy) void (^didPresentBlock)(BOOL isPresent);

- (instancetype)initWithPopoverItems:(NSArray *)popoverItems presentFrame:(CGRect)presentFrame;

+ (instancetype)menuWithPopoverItems:(NSArray *)popoverItems presentFrame:(CGRect)presentFrame;
@end
