//
//  MHMainTopView.m
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHMainTopView.h"

@interface MHMainTopView ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) NSMutableArray *buttonMu;
@end

@implementation MHMainTopView

- (NSMutableArray *)buttonMu{
    if (!_buttonMu) {
        
        _buttonMu = [[NSMutableArray alloc]init];
    }
    return _buttonMu;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat btnWidth = self.width / titles.count;
        CGFloat btnHeight = self.height;
        for (NSInteger i = 0; i< titles.count; i ++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *vcName = titles[i];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;
            
            titleBtn.frame = CGRectMake(i * btnWidth, 0,btnWidth , btnHeight);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
            
            if (i == 1) {
                CGFloat h = 2;
                CGFloat y = 40;
                [titleBtn.titleLabel sizeToFit];
                self.lineView = [[UIView alloc]init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h;
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                [self addSubview:self.lineView];
                
            }
        }
    }
    return self;
}
#pragma mark - 点击事件
- (void)titleClick:(UIButton *)button{
    
    self.topBlock(button.tag);
    [self scrolling:button.tag];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.lineView.centerX = button.centerX;
    } completion:nil];

}

#pragma mark - 外界调用
- (void)scrolling:(NSInteger)tag{
    
    [UIView animateWithDuration:0.5 animations:^{
        
//    self.lineView.centerX = button.centerX;
    } completion:nil];

}























@end
