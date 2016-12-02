//
//  JKMenuViewController.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKMenuViewController.h"
#import "JKPresentationPopoverManager.h"
#import "JKMenuTableViewCell.h"
#import "JKPresentationPopoverItem.h"

@interface JKMenuViewController () <UITableViewDataSource, UITableViewDelegate>
/** 自定义转场动画管理 */
@property (nonatomic, strong) JKPresentationPopoverManager *animationManager;

/** popover显示的frame */
@property (nonatomic, assign) CGRect presentFrame;

/** tableView */
@property (nonatomic, weak) UITableView *tableView;

/** 模型数组 */
@property (nonatomic, strong) NSArray *popoverItems;

/** 第一个模型*/
@property (nonatomic, strong) JKPresentationPopoverItem *firstItem;

/** 背景图 */
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation JKMenuViewController

static NSString *reuseID = @"JKMenuTableViewCell"; // 重用ID

- (instancetype)init{
    if (self = [super init]) {
        self.presentFrame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 180) * 0.5, ([UIScreen mainScreen].bounds.size.height - 320) * 0.5, 180, 320);
        self.transitioningDelegate = self.animationManager;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (instancetype)initWithPopoverItems:(NSArray *)popoverItems presentFrame:(CGRect)presentFrame{
    if (self = [super init]) {
        self.presentFrame = presentFrame;
        self.popoverItems = popoverItems;
        self.transitioningDelegate = self.animationManager;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

+ (instancetype)menuWithPopoverItems:(NSArray *)popoverItems presentFrame:(CGRect)presentFrame{
    return [[self alloc] initWithPopoverItems:popoverItems presentFrame:presentFrame];
}

#pragma mark - 懒加载
- (JKPresentationPopoverManager *)animationManager{
    if (!_animationManager) {
        _animationManager = [[JKPresentationPopoverManager alloc] init];
        _animationManager.presentFrame = self.presentFrame;
        
        __weak typeof(self) weakSelf = self;
        [_animationManager setDidPresentBlock:^(BOOL isPresent) {
            !weakSelf.didPresentBlock ? : weakSelf.didPresentBlock(isPresent);
        }];
    }
    return _animationManager;
}

- (void)setPopoverItems:(NSArray *)popoverItems{
    _popoverItems = popoverItems;
    
    if (_popoverItems.count <= 0 || _popoverItems == nil) return;
    
    self.firstItem = _popoverItems.firstObject;
    
    self.animationManager.animationDuration = self.firstItem.animationDuration;
}

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.frame = CGRectMake(0, 0, self.presentFrame.size.width, self.presentFrame.size.height);
    [self.view insertSubview:bgImageView atIndex:0];
    
    [self setupTableView];
    
    if (!self.firstItem.bgImageName) return;
    
    bgImageView.image = [UIImage imageNamed:self.firstItem.bgImageName];
}

- (void)setupTableView{
    UITableView *tableView = [[UITableView alloc] init];
    
    tableView.frame = CGRectMake(self.firstItem.tableViewContentInset.left, self.firstItem.tableViewContentInset.top, self.presentFrame.size.width - self.firstItem.tableViewContentInset.left - self.firstItem.tableViewContentInset.right, self.presentFrame.size.height - self.firstItem.tableViewContentInset.top - self.firstItem.tableViewContentInset.bottom);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.scrollEnabled = self.firstItem.scrollEnabled;
    
    // 注册cell
    [tableView registerClass:[JKMenuTableViewCell class] forCellReuseIdentifier:reuseID];
}

#pragma mark - tableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.popoverItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JKMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    cell.popoverItem = self.popoverItems[indexPath.row];
    cell.firstPopoverItem = self.firstItem;
    
    return cell;
}

#pragma mark - tableView代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.firstItem.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JKPresentationPopoverItem *popoverItem = self.popoverItems[indexPath.row];
    
    [self dismissViewControllerAnimated:YES completion:^{
        !popoverItem.operationBlock ? : popoverItem.operationBlock();
    }];
}

- (void)dealloc{
    NSLog(@"%d, %s",__LINE__, __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
