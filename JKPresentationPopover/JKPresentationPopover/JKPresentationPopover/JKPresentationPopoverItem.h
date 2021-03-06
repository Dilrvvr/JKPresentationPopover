//
//  JKPresentationPopoverItem.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKPresentationPopoverConfiguration;

@interface JKPresentationPopoverItem : NSObject

/** icon */
@property (nonatomic, copy) NSString *icon;

/** highlightedIcon */
@property (nonatomic, copy) NSString *highlightedIcon;


/** iconImage */
@property (nonatomic, strong) UIImage *iconImage;

/** highlightedIconImage */
@property (nonatomic, strong) UIImage *highlightedIconImage;


/** title */
@property (nonatomic, copy) NSString *title;

/** attributedTitle */
@property (nonatomic, copy) NSAttributedString *attributedTitle;


/** 点击后的操作block */
@property (nonatomic, copy) void (^operation)(JKPresentationPopoverItem *item);



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

/** cell底部分隔线左边距 默认0 */
@property (nonatomic, assign) CGFloat cellBottomSeparatorLineLeftMargin;

/** cell底部分隔线 左右下 间距 默认0 */
@property (nonatomic, assign) UIEdgeInsets cellBottomSeparatorLineInset;

+ (void)itemWithIcon:(NSString *)icon
               title:(NSString *)title
       configuration:(JKPresentationPopoverConfiguration *)configuration
          itemConfig:(void(^)(JKPresentationPopoverItem *item))itemConfig
           operation:(void(^)(JKPresentationPopoverItem *item))operation;
@end
