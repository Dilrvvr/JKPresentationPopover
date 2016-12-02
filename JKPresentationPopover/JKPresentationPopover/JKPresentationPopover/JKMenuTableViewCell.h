//
//  JKMenuTableViewCell.h
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKPresentationPopoverItem;

@interface JKMenuTableViewCell : UITableViewCell
/** 模型 */
@property (nonatomic, strong) JKPresentationPopoverItem *popoverItem;

/** 第一个模型，负责全局设置 */
@property (nonatomic, strong) JKPresentationPopoverItem *firstPopoverItem;
@end
