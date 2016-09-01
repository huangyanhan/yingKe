//
//  MHTabBar.m
//  yingKe1
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHTabBar.h"

@interface MHTabBar ()

@property (nonatomic, strong) UIImageView *tabbarView;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation MHTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景
        [self addSubview:self.tabbarView];
//        装再item
        for (NSInteger i = 0; i < self.dataList.count; i++) {
            
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = MHItemTypeLive + i;
            
            [self addSubview:item];
        }
    }
    return self;
}
- (void)clickItem:(UIButton *)button{
    if ([self.deleagte respondsToSelector:@selector(tabBar:clickButton:)]) {
        
        [self.deleagte tabBar:self clickButton:button.tag ];
    }
    
    if (_tabBlock) {
        
        _tabBlock(self,button.tag);
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabbarView.frame = self.bounds;
    CGFloat width = self.bounds.size.width / self.dataList.count;
    for (NSUInteger i = 0; i < [self subviews].count; i ++) {
        
        UIView *btn = [self subviews][i];
        
        if ([btn isKindOfClass:[UIButton class]]) {
            
            btn.frame = CGRectMake((btn.tag - MHItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
}
- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}
- (UIImageView *)tabbarView{
    if (!_tabbarView) {
        
        _tabbarView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbarView;
}


















@end
