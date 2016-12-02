//
//  ViewController.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/2.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "ViewController.h"
#import "JKMenuViewController.h"
#import "JKPresentPopoverTool.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
}

- (IBAction)presentVc:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    
    weakSelf.view.backgroundColor = [UIColor cyanColor];
    
    // items
    JKPresentationPopoverItem *item1 = [JKPresentationPopoverItem itemWithTitleText:@"红色" normalIconImageName:nil highlightedIconImageName:nil operationBlock:^{
        
        weakSelf.view.backgroundColor = [UIColor redColor];
    }];
    
    item1.tableViewContentInset = UIEdgeInsetsMake(20, 10, 10, 10);
    item1.normalTitleTextColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0 alpha:1];
    item1.highlightedTitleTextColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0 alpha:1];
    item1.bgImageName = @"defaultBg";
    item1.cellBgColor = [UIColor clearColor];
    item1.titleTextFontSize = 14;
    
    JKPresentationPopoverItem *item2 = [JKPresentationPopoverItem itemWithTitleText:@"绿色" normalIconImageName:nil highlightedIconImageName:nil operationBlock:^{
        
        weakSelf.view.backgroundColor = [UIColor greenColor];
    }];
    
    JKPresentationPopoverItem *item3 = [JKPresentationPopoverItem itemWithTitleText:@"蓝色" normalIconImageName:nil highlightedIconImageName:nil operationBlock:^{
        
        weakSelf.view.backgroundColor = [UIColor blueColor];
    }];
    
    // 展示的frame
    CGRect presentFrame = CGRectMake(sender.frame.origin.x + (sender.frame.size.width - 100) * 0.5, CGRectGetMaxY(sender.frame), 100, 161);
    
    // 工具类 show
    [JKPresentPopoverTool showWithPopoverItems:@[item1, item2, item3] presentFrame:presentFrame didPresentBlock:^(BOOL isPresent) { // 监听展现和消失
        
        sender.selected = isPresent;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
