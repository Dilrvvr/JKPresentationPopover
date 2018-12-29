//
//  JKPresentationPopoverItem.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKPresentationPopoverItem : NSObject

/******************** 给第一个item赋值即可 ********************/


/** 整个的背景图片 */
@property (nonatomic, copy) NSString *bgImageName;

/** 是否允许滚动 默认不允许 */
@property (nonatomic, assign) BOOL scrollEnabled;

/** 动画时长 默认0.25s */
@property (nonatomic, assign) CGFloat animationDuration;

/** tableView的上下左右 全部为正数 写的是tableView的frame上下左右间距 */
@property (nonatomic, assign) UIEdgeInsets tableViewContentInset;

/** cell选中样式 默认default */
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

/** cell高度 默认44 */
@property (nonatomic, assign) CGFloat cellHeight;

/** cell背景图片 */
@property (nonatomic, copy) NSString *cellBgImageName;

/** cell背景颜色 默认白色 */
@property (nonatomic, strong) UIColor *cellBgColor;

/** cell底部分隔线是否隐藏 默认不隐藏 */
@property (nonatomic, assign) BOOL cellBottomSeparatorLineHidden;

/** cell底部分隔线颜色 默认浅灰色 */
@property (nonatomic, strong) UIColor *cellBottomSeparatorLineColor;

/** cell底部分隔线左边距 默认0 */
@property (nonatomic, assign) CGFloat cellBottomSeparatorLineLeftMargin;

/** cell底部分隔线右边距 默认0 */
@property (nonatomic, assign) CGFloat cellBottomSeparatorLineRightMargin;

/** 标题普通文字颜色 默认黑色 */
@property (nonatomic, copy) UIColor *normalTitleTextColor;

/** 标题高亮文字颜色 默认黑色 */
@property (nonatomic, strong) UIColor *highlightedTitleTextColor;

/** 标题文字字体大小 默认12 */
@property (nonatomic, assign) CGFloat titleTextFontSize;


/******************** 每个cell的属性 ********************/

/** 普通图标 */
@property (nonatomic, copy) NSString *normalIconImageName;

/** 高亮图标 */
@property (nonatomic, copy) NSString *highlightedIconImageName;

/** 标题 */
@property (nonatomic, copy) NSString *titleText;

/** 点击后的操作block */
@property (nonatomic, copy) void (^operationBlock)();

+ (instancetype)itemWithTitleText:(NSString *)titleText normalIconImageName:(NSString *)normalIconImageName highlightedIconImageName:(NSString *)highlightedIconImageName operationBlock:(void(^)())operationBlock;

/*
+ (instancetype)itemWithTitle:(NSString *)title
                   normalIcon:(NSString *)normalIcon
               operationBlock:(void(^)())operationBlock; //*/
@end
