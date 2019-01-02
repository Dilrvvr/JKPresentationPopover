//
//  JKPresentationPopoverCell.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentationPopoverCell.h"
#import "JKPresentationPopoverItem.h"

@interface JKPresentationPopoverCell ()

/** 底部分割线 */
@property (nonatomic, weak) UIView *bottomSepLineView;
@end

@implementation JKPresentationPopoverCell

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
    
    self.selectedBackgroundView = [[UIImageView alloc] init];
}

- (void)setPopoverItem:(JKPresentationPopoverItem *)popoverItem{
    _popoverItem = popoverItem;
    
    self.selectionStyle = _popoverItem.selectionStyle;
    self.backgroundColor = _popoverItem.cellBackgroundColor;
    
    self.textLabel.font = _popoverItem.titleFont;
    self.textLabel.textColor = _popoverItem.titleColor;
    self.textLabel.highlightedTextColor = _popoverItem.highlightedTitleColor;
    self.textLabel.textAlignment = _popoverItem.textAlignment;
    
    self.textLabel.text = _popoverItem.title;
    
    self.bottomSepLineView.backgroundColor = _popoverItem.cellBottomSeparatorLineColor;
    self.bottomSepLineView.hidden = _popoverItem.cellBottomSeparatorLineHidden;
    
    if (_popoverItem.cellBackgroundImage) {
        
        self.backgroundView = [[UIImageView alloc] initWithImage:_popoverItem.cellBackgroundImage];
        
    } else {
        
        self.backgroundView = nil;
    }
    
    [(UIImageView *)self.selectedBackgroundView setImage:nil];
    
    if (_popoverItem.cellSelectedBackgroundImage) {
        
        [(UIImageView *)self.selectedBackgroundView setImage:_popoverItem.cellBackgroundImage];
        
    } else if (_popoverItem.cellSelectedBackgroundColor) {
        
        self.selectedBackgroundView.backgroundColor = _popoverItem.cellSelectedBackgroundColor;
        
    } else {
        
        self.selectedBackgroundView.backgroundColor = nil;
    }
    
    if (_popoverItem.iconImage) {
        
        self.imageView.image = _popoverItem.iconImage;
        
    } else if (_popoverItem.icon) {
        
        self.imageView.image = [UIImage imageNamed:_popoverItem.icon];
        
    } else {
        
        self.imageView.image = nil;
    }
    
    if (_popoverItem.highlightedIconImage) {
        
        self.imageView.highlightedImage = _popoverItem.highlightedIconImage;
        
    } else if (_popoverItem.highlightedIcon) {
        
        self.imageView.highlightedImage = [UIImage imageNamed:_popoverItem.highlightedIcon];
        
    } else {
        
        self.imageView.highlightedImage = nil;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.bottomSepLineView.frame = CGRectMake(self.popoverItem.cellBottomSeparatorLineInset.left, self.frame.size.height - 0.5 - self.popoverItem.cellBottomSeparatorLineInset.bottom, self.frame.size.width - self.popoverItem.cellBottomSeparatorLineInset.left - self.popoverItem.cellBottomSeparatorLineInset.right, 0.5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.bottomSepLineView.backgroundColor = self.popoverItem.cellBottomSeparatorLineColor;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    self.bottomSepLineView.backgroundColor = self.popoverItem.cellBottomSeparatorLineColor;
    
    self.textLabel.highlighted = highlighted;
    self.imageView.highlighted = highlighted;
}
@end
