//
//  JKPresentationPopoverItem.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentationPopoverItem.h"

@implementation JKPresentationPopoverItem
+ (instancetype)itemWithTitleText:(NSString *)titleText normalIconImageName:(NSString *)normalIconImageName highlightedIconImageName:(NSString *)highlightedIconImageName operationBlock:(void (^)())operationBlock{
    JKPresentationPopoverItem *item = [[self alloc] init];
    
    item.titleText = titleText;
    item.normalIconImageName = normalIconImageName;
    item.highlightedIconImageName = highlightedIconImageName;
    item.operationBlock = operationBlock;
    
    return item;
}

- (instancetype)init{
    if (self = [super init]) {
        
        /** cell底部分隔线左边距 默认0 */
        self.cellBottomSeparatorLineLeftMargin = 10;
        
        /** cell底部分隔线右边距 默认0 */
        self.cellBottomSeparatorLineRightMargin = 10;
        
        /** 标题普通文字颜色 默认黑色 */
        self.normalTitleTextColor = [UIColor blackColor];
        
        /** 标题高亮文字颜色 默认黑色 */
        self.highlightedTitleTextColor = [UIColor blackColor];
        
        /** 标题文字字体大小 默认12 */
        self.titleTextFontSize = 12;
        
        /** cell背景颜色 默认白色 */
        self.cellBgColor = [UIColor whiteColor];
        
        /** cell底部分隔线颜色 默认浅灰色 */
        self.cellBottomSeparatorLineColor = [UIColor lightGrayColor];
        
        /** cell底部分隔线是否隐藏 默认不隐藏 */
        self.cellBottomSeparatorLineHidden = NO;
        
        /** 是否允许滚动 默认不允许 */
        self.scrollEnabled = NO;
        
        /** cell选中样式 默认default */
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        /** 动画时长 默认0.25s */
        self.animationDuration = 0.25;
        
        /** cell高度 默认44 */
        self.cellHeight = 44;
    }
    return self;
}
@end
