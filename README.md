# JKPresentationPopover
自定义present动画实现popover
***
![image](https://github.com/Jacky-An/JKPresentationPopover/raw/master/introductionimages/JKPresentationPopover.gif)
***

    // 导入头文件
    #import "JKPresentPopoverTool.h"
    
    // 创建item
    // 在JKPresentationPopoverItem.h 中查看属性
    JKPresentationPopoverItem *item1 = [JKPresentationPopoverItem itemWithTitleText:@"红色" normalIconImageName:nil highlightedIconImageName:nil operationBlock:^{
        // item对应cell点击事件写在这里，注意循环引用问题
    }];
    
    item2、item3......
    
    // 展示的frame
    CGRect presentFrame = CGRectMake(sender.frame.origin.x + (sender.frame.size.width - 100) * 0.5, CGRectGetMaxY(sender.frame), 100, 161);
    
    // 工具类 show
    /**
     * 工具便捷类方法
     * popoverItems : 存放JKPresentationPopoverItem对象的数组，只要数组中有一个不是item，即不会显示
     * presentFrame : 显示的位置，相对于屏幕
     * didPresentBlock : 监听present和dismiss的block，需要据此改变自身控件状态的可以使用
     */
    [JKPresentPopoverTool showWithPopoverItems:@[item1, item2, item3] presentFrame:presentFrame didPresentBlock:^(BOOL isPresent) { 
        // 监听展现和消失，注意循环引用问题
        
        sender.selected = isPresent;
    }];
