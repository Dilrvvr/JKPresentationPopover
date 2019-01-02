//
//  JKPresentationPopoverConfiguration.h
//  JKPresentationPopover
//
//  Created by albert on 2019/1/2.
//  Copyright © 2019 albert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKPresentationPopoverConst.h"

@interface JKPresentationPopoverConfiguration : NSObject

/** itemArray */
@property (nonatomic, strong, readonly) NSMutableArray *itemArray;

/** presentFrame */
@property (nonatomic, assign) CGRect presentFrame;

/** 整个的背景图片 */
@property (nonatomic, strong) UIImage *backgroundImage;

/** tableViewBackgroundColor 默认nil */
@property (nonatomic, strong) UIColor *tableViewBackgroundColor;

/** 是否允许滚动 默认不允许 */
@property (nonatomic, assign) BOOL scrollEnabled;

/** 动画方向 默认从上到下 */
@property (nonatomic, assign) JKPresentPopoverAnimationDirection animationDirection;

/** 动画时长 默认0.25s */
@property (nonatomic, assign) CGFloat animationDuration;

/** tableView的上下左右间距 全部为正数 写的是tableView的frame上下左右间距 */
@property (nonatomic, assign) UIEdgeInsets tableViewInset;



/** cell高度 默认44 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 标题文字字体大小 默认12 */
@property (nonatomic, strong) UIFont *titleFont;

/** 标题普通文字颜色 默认黑色 */
@property (nonatomic, strong) UIColor *titleColor;

/** 标题高亮文字颜色 默认黑色 0.5透明 */
@property (nonatomic, strong) UIColor *highlightedTitleColor;

/** textAlignment */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/** cell选中样式 默认default */
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

/** cell背景图片 */
@property (nonatomic, strong) UIImage *cellBackgroundImage;

/** cell选中背景图片 */
@property (nonatomic, strong) UIImage *cellSelectedBackgroundImage;

/** cell背景颜色 默认白色 */
@property (nonatomic, strong) UIColor *cellBackgroundColor;

/** cell选中背景颜色 默认白色 */
@property (nonatomic, strong) UIColor *cellSelectedBackgroundColor;

/** cell底部分隔线是否隐藏 默认不隐藏 */
@property (nonatomic, assign) BOOL cellBottomSeparatorLineHidden;

/** cell底部分隔线颜色 默认浅灰色 */
@property (nonatomic, strong) UIColor *cellBottomSeparatorLineColor;

/** cell底部分隔线 左右下 间距 默认0 */
@property (nonatomic, assign) UIEdgeInsets cellBottomSeparatorLineInset;


+ (void)configurationWithTitleFont:(UIFont *)titleFont
                        titleColor:(UIColor *)titleColor
                     configuration:(void(^)(JKPresentationPopoverConfiguration *configuration))configuration;
@end
