//
//  JKPresentationPopoverCell.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKPresentationPopoverItem;

@interface JKPresentationPopoverCell : UITableViewCell

/** 模型 */
@property (nonatomic, strong) JKPresentationPopoverItem *popoverItem;
@end
