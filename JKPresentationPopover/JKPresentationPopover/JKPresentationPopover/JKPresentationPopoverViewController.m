//
//  JKPresentationPopoverViewController.m
//  JKPresentationPopover
//
//  Created by albert on 16/12/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "JKPresentationPopoverViewController.h"
#import "JKPresentationPopoverTransitionManager.h"
#import "JKPresentationPopoverCell.h"
#import "JKPresentationPopoverItem.h"
#import "JKPresentationPopoverConfiguration.h"

@interface JKPresentationPopoverViewController () <UITableViewDataSource, UITableViewDelegate>

/** 自定义转场动画管理 */
@property (nonatomic, strong) JKPresentationPopoverTransitionManager *animationManager;

/** 配置模型 */
@property (nonatomic, strong) JKPresentationPopoverConfiguration *configuration;

/** tableView */
@property (nonatomic, weak) UITableView *tableView;

/** 背景图 */
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation JKPresentationPopoverViewController

static NSString *reuseID = @"JKMenuTableViewCell"; // 重用ID

- (instancetype)init{
    if (self = [super init]) {
        self.configuration = [JKPresentationPopoverConfiguration new];
        self.transitioningDelegate = self.animationManager;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (instancetype)initWithWithConfiguration:(JKPresentationPopoverConfiguration *)configuration{
    if (self = [super init]) {
        self.configuration = configuration;
        self.transitioningDelegate = self.animationManager;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

+ (instancetype)popoverWithConfiguration:(JKPresentationPopoverConfiguration *)configuration{
    
    return [[self alloc] initWithWithConfiguration:configuration ? configuration : [JKPresentationPopoverConfiguration new]];
}

#pragma mark - 懒加载
- (JKPresentationPopoverTransitionManager *)animationManager{
    if (!_animationManager) {
        _animationManager = [[JKPresentationPopoverTransitionManager alloc] init];
        _animationManager.presentFrame = self.configuration.presentFrame;
        _animationManager.animationDirection = self.configuration.animationDirection;
        
        __weak typeof(self) weakSelf = self;
        
        [_animationManager setDidPresentBlock:^(BOOL isPresent) {
            
            !weakSelf.didPresentBlock ? : weakSelf.didPresentBlock(isPresent);
        }];
    }
    return _animationManager;
}

- (void)setConfiguration:(JKPresentationPopoverConfiguration *)configuration{
    _configuration = configuration;
    
    if (_configuration == nil || _configuration.itemArray.count <= 0) return;
    
    self.animationManager.animationDuration = _configuration.animationDuration;
}

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.frame = CGRectMake(0, 0, self.configuration.presentFrame.size.width, self.configuration.presentFrame.size.height);
    [self.view insertSubview:bgImageView atIndex:0];
    
    [self setupTableView];
    
    if (!self.configuration.backgroundImage) return;
    
    bgImageView.image = [self.configuration.backgroundImage stretchableImageWithLeftCapWidth:self.configuration.backgroundImage.size.width * 0.5 topCapHeight:self.configuration.backgroundImage.size.height * 0.5];
}

- (void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    
    tableView.frame = CGRectMake(self.configuration.tableViewInset.left, self.configuration.tableViewInset.top, self.configuration.presentFrame.size.width - self.configuration.tableViewInset.left - self.configuration.tableViewInset.right, self.configuration.presentFrame.size.height - self.configuration.tableViewInset.top - self.configuration.tableViewInset.bottom);
    
    tableView.backgroundColor = self.configuration.tableViewBackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.scrollEnabled = self.configuration.scrollEnabled;
    
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    // 注册cell
    [tableView registerClass:[JKPresentationPopoverCell class] forCellReuseIdentifier:reuseID];
}

#pragma mark - tableView数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.configuration.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JKPresentationPopoverCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    cell.popoverItem = [self.configuration.itemArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - tableView代理

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JKPresentationPopoverItem *item = [self.configuration.itemArray objectAtIndex:indexPath.row];
    
    return item.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JKPresentationPopoverItem *popoverItem = [self.configuration.itemArray objectAtIndex:indexPath.row];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.configuration.animationDuration + 0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        !popoverItem.operation ? : popoverItem.operation(popoverItem);
    });
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
