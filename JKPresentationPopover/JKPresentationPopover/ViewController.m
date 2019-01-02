//
//  ViewController.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/2.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "ViewController.h"
#import "JKPresentationPopoverTool.h"

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
    
    [JKPresentationPopoverConfiguration configurationWithTitleFont:[UIFont systemFontOfSize:14] titleColor:[UIColor colorWithRed:255/255.0 green:204/255.0 blue:0 alpha:1] configuration:^(JKPresentationPopoverConfiguration *configuration) {
        
        configuration.titleColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0 alpha:1];
        configuration.highlightedTitleColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0 alpha:0.5];
        configuration.textAlignment = NSTextAlignmentCenter;
        
        configuration.backgroundImage = [UIImage imageNamed:@"defaultBg"];
        configuration.cellBackgroundColor = [UIColor clearColor];
        
        configuration.selectionStyle = UITableViewCellSelectionStyleDefault;
        configuration.cellSelectedBackgroundColor = [UIColor colorWithWhite:0.6 alpha:1];
       
        [JKPresentationPopoverItem itemWithIcon:nil title:@"红色" configuration:configuration itemConfig:^(JKPresentationPopoverItem *item) {
            
        } operation:^(JKPresentationPopoverItem *item) {
            
            weakSelf.view.backgroundColor = [UIColor redColor];
        }];
        
        [JKPresentationPopoverItem itemWithIcon:nil title:@"绿色" configuration:configuration itemConfig:^(JKPresentationPopoverItem *item) {
            
        } operation:^(JKPresentationPopoverItem *item) {
            
            weakSelf.view.backgroundColor = [UIColor greenColor];
        }];
        
        [JKPresentationPopoverItem itemWithIcon:nil title:@"蓝色" configuration:configuration itemConfig:^(JKPresentationPopoverItem *item) {
            
            item.cellBottomSeparatorLineHidden = YES;
            
        } operation:^(JKPresentationPopoverItem *item) {
            
            weakSelf.view.backgroundColor = [UIColor blueColor];
        }];
        
        configuration.tableViewInset = UIEdgeInsetsMake(20, 10, 10, 10);
        
        configuration.presentFrame = CGRectMake(sender.frame.origin.x + (sender.frame.size.width - 100) * 0.5, CGRectGetMaxY(sender.frame), 100, 162);
        
        [JKPresentationPopoverTool showWithConfiguration:configuration viewController:self didPresentBlock:^(BOOL isPresent) { // 监听展现和消失
            
            sender.selected = isPresent;
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
