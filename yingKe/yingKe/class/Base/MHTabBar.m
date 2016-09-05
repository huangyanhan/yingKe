//
//  MHTabBar.m
//  yingKe1
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHTabBar.h"

@interface MHTabBar ()

@property (nonatomic, strong) UIImageView *tabbarView;//
@property (nonatomic, strong) NSArray *dataList;//
@property (nonatomic, strong) UIButton *lastItem;//
@property (nonatomic, strong) UIButton *cameraBtn;//相机

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
            
            item.adjustsImageWhenHighlighted = NO;//去除图片的高亮
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = MHItemTypeLive + i;
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            [self addSubview:item];
        }
        [self addSubview:self.cameraBtn];
    }
    return self;
}
#pragma mark - 点击事件
- (void)clickItem:(UIButton *)button{
    if ([self.deleagte respondsToSelector:@selector(tabBar:clickButton:)]) {
        
        [self.deleagte tabBar:self clickButton:button.tag ];
    }
    
    if (_tabBlock) {
        
        _tabBlock(self,button.tag);
    }
    
    if (button.tag == MHItemTypelaunch) {
        return;
    }
    //按钮的切换
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    //设置tabbar的动画效果
    [UIView animateWithDuration:0.2 animations:^{
        
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
           
            button.transform = CGAffineTransformIdentity;
        }];
        
    }];
    
}

#pragma mark - 设置范围
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
    [self.cameraBtn sizeToFit];
    self.cameraBtn.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 50);
}
#pragma mark - 懒加载
- (UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        _cameraBtn.tag = MHItemTypelaunch;
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
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
