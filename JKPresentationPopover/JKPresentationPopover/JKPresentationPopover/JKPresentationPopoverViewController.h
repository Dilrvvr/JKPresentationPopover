//
//  JKPresentationPopoverViewController.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKPresentationPopoverTransitionManager, JKPresentationPopoverItem, JKPresentationPopoverConfiguration;

@interface JKPresentationPopoverViewController : UIViewController

/** 监听是否present的block */
@property (nonatomic, copy) void (^didPresentBlock)(BOOL isPresent);

- (instancetype)initWithWithConfiguration:(JKPresentationPopoverConfiguration *)configuration;

+ (instancetype)popoverWithConfiguration:(JKPresentationPopoverConfiguration *)configuration;
@end
