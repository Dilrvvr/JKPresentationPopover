//
//  JKPresentationPopoverConfiguration.m
//  JKPresentationPopover
//
//  Created by albert on 2019/1/2.
//  Copyright © 2019 albert. All rights reserved.
//

#import "JKPresentationPopoverConfiguration.h"

@interface JKPresentationPopoverConfiguration ()
{
    NSMutableArray *_itemArray;
}
@end

@implementation JKPresentationPopoverConfiguration

+ (void)configurationWithTitleFont:(UIFont *)titleFont
                        titleColor:(UIColor *)titleColor
                     configuration:(void(^)(JKPresentationPopoverConfiguration *configuration))configuration{
    
    JKPresentationPopoverConfiguration *config = [[JKPresentationPopoverConfiguration alloc] init];
    
    config.titleFont = titleFont;
    config.titleColor = titleColor;
    
    !configuration ? : configuration(config);
}

- (instancetype)init{
    if (self = [super init]) {
        
        /** cell底部分隔线 左右下 间距 默认0 */
        self.cellBottomSeparatorLineInset = UIEdgeInsetsZero;
        
        /** 标题普通文字颜色 默认黑色 */
        self.titleColor = [UIColor blackColor];
        
        /** 标题高亮文字颜色 默认黑色 0.5透明 */
        self.highlightedTitleColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        /** 标题文字字体大小 默认12 */
        self.titleFont = [UIFont systemFontOfSize:12];
        
        /** cell背景颜色 默认白色 */
        self.cellBackgroundColor = [UIColor whiteColor];
        
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

#pragma mark
#pragma mark - Property

- (NSMutableArray *)itemArray{
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}
@end
