//
//  MHTabBar.h
//  yingKe1
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MHItemType){//定义枚举
    
    MHItemTypeLive = 100,//显示直播
    MHItemTypeMe,//我
};

@class MHTabBar;

typedef void(^tabBarBlock)(MHTabBar *tabBar,MHItemType idx);

@protocol  MHTabBarDelegate<NSObject>//定义协议
- (void)tabBar:(MHTabBar *)tabBar clickButton:(MHItemType)idx;
@end

@interface MHTabBar : UIView
@property (nonatomic, weak) id<MHTabBarDelegate> deleagte;
@property (nonatomic, copy) tabBarBlock tabBlock;
@end
