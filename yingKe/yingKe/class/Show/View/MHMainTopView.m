//
//  MHMainTopView.m
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHMainTopView.h"

@interface MHMainTopView ()
@property (nonatomic, strong) UIView *lineView;//下面的线
@property (nonatomic, strong) NSMutableArray *buttonMu;//
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
            //设置字体
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;//设置tag值
            [self.buttonMu addObject:titleBtn];
            titleBtn.frame = CGRectMake(i * btnWidth, 0,btnWidth , btnHeight);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
            
            //热门下面的线的设置
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
}

#pragma mark - 外界调用
- (void)scrolling:(NSInteger)tag{
    
    UIButton *button = self.buttonMu[tag];
    [UIView animateWithDuration:0.5 animations:^{
        
    self.lineView.centerX = button.centerX;
    } completion:nil];

}























@end
