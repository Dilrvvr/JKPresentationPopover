//
//  JKMenuTableViewCell.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKMenuTableViewCell.h"
#import "JKPresentationPopoverItem.h"

@interface JKMenuTableViewCell ()
/** 底部分割线 */
@property (nonatomic, weak) UIView *bottomSepLineView;
@end

@implementation JKMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    /** 底部分割线 */
    UIView *bottomSepLineView = [[UIView alloc] init];
    [self addSubview:bottomSepLineView];
    self.bottomSepLineView = bottomSepLineView;
}

- (void)setPopoverItem:(JKPresentationPopoverItem *)popoverItem{
    _popoverItem = popoverItem;
    
    self.textLabel.text = _popoverItem.titleText;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    
    if (!_popoverItem.normalIconImageName) return;
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    
    self.imageView.image = [UIImage imageNamed:_popoverItem.normalIconImageName];
    self.imageView.highlightedImage = [UIImage imageNamed:_popoverItem.highlightedIconImageName];
}

- (void)setFirstPopoverItem:(JKPresentationPopoverItem *)firstPopoverItem{
    _firstPopoverItem = firstPopoverItem;
    
    self.selectionStyle = _firstPopoverItem.selectionStyle;
    self.backgroundColor = _firstPopoverItem.cellBgColor;
    
    self.textLabel.textColor = _firstPopoverItem.normalTitleTextColor;
    self.textLabel.highlightedTextColor = _firstPopoverItem.highlightedTitleTextColor;
    self.textLabel.font = [UIFont systemFontOfSize:_firstPopoverItem.titleTextFontSize];
    
    self.bottomSepLineView.backgroundColor = _firstPopoverItem.cellBottomSeparatorLineColor;
    self.bottomSepLineView.hidden = _firstPopoverItem.cellBottomSeparatorLineHidden;
    
    if (!_firstPopoverItem.cellBgImageName) return;
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_firstPopoverItem.cellBgImageName]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.bottomSepLineView.frame = CGRectMake(self.firstPopoverItem.cellBottomSeparatorLineLeftMargin, self.frame.size.height - 1, self.frame.size.width - self.firstPopoverItem.cellBottomSeparatorLineLeftMargin - self.firstPopoverItem.cellBottomSeparatorLineRightMargin, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
