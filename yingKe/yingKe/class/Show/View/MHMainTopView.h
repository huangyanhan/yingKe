//
//  MHMainTopView.h
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^mainTopBlock)(NSInteger tag);

@interface MHMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property (nonatomic,copy) mainTopBlock topBlock;

- (void)scrolling:(NSInteger)tag;


@end
