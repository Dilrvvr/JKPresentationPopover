//
//  JKPresentationPopoverItem.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentationPopoverItem.h"
#import "JKPresentationPopoverConfiguration.h"

@interface JKPresentationPopoverItem ()

@end

@implementation JKPresentationPopoverItem

+ (void)itemWithIcon:(NSString *)icon
                       title:(NSString *)title
               configuration:(JKPresentationPopoverConfiguration *)configuration
                  itemConfig:(void(^)(JKPresentationPopoverItem *item))itemConfig
                   operation:(void(^)(JKPresentationPopoverItem *item))operation{
    
    JKPresentationPopoverItem *item = [[JKPresentationPopoverItem alloc] init];
    
    item.title = title;
    item.icon = icon;
    item.operation = operation;
    
    [item makeConfiguration:configuration];
    
    !itemConfig ? : itemConfig(item);
}

- (void)makeConfiguration:(JKPresentationPopoverConfiguration *)configuration{
    
    [configuration.itemArray addObject:self];
    
    self.cellHeight = configuration.cellHeight;
    self.titleFont  = configuration.titleFont;
    self.titleColor = configuration.titleColor;
    
    self.highlightedTitleColor = configuration.highlightedTitleColor;
    
    self.textAlignment  = configuration.textAlignment;
    self.selectionStyle = configuration.selectionStyle;
    
    self.cellBackgroundColor         = configuration.cellBackgroundColor;
    self.cellSelectedBackgroundColor = configuration.cellSelectedBackgroundColor;
    
    self.cellBackgroundImage         = configuration.cellBackgroundImage;
    self.cellSelectedBackgroundImage = configuration.cellSelectedBackgroundImage;
    
    self.cellBottomSeparatorLineHidden = configuration.cellBottomSeparatorLineHidden;
    self.cellBottomSeparatorLineColor  = configuration.cellBottomSeparatorLineColor;
    self.cellBottomSeparatorLineInset  = configuration.cellBottomSeparatorLineInset;
}
@end
