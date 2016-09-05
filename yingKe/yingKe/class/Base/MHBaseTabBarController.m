//
//  MHBaseTabBarController.m
//  yingKe1
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHBaseTabBarController.h"
#import "MHTabBar.h"
#import "MHBaseNavigationController.h"
#import "MHLaunchViewController.h"

@interface MHBaseTabBarController ()<MHTabBarDelegate>

@property (nonatomic, strong) MHTabBar *MHtabbar;

@end

@implementation MHBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //增加控制器
    [self configViewController];
    //怎加tabBar
    [self.tabBar addSubview:self.MHtabbar];
    
    //解决按钮后面的线
    [[UITabBar appearance]setShadowImage:[UIImage new]];
    [[UITabBar appearance]setBackgroundImage:[UIImage new]];

}
#pragma mark - 怎加viewcontroller
- (void)configViewController{
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:@[@"MHMainViewController",@"MHMeViewController"]];
    
    for (NSUInteger i = 0; i < dataArray.count; i++) {
        
        NSString *vcName = dataArray[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        
        MHBaseNavigationController *nav = [[MHBaseNavigationController alloc]initWithRootViewController:vc];
        [dataArray replaceObjectAtIndex:i withObject:nav];
        
    }
    self.viewControllers = dataArray;
}
#pragma mark - 懒加载
- (MHTabBar *)MHtabbar
{
    if (!_MHtabbar) {
        
        _MHtabbar = [[MHTabBar alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 49)];
        _MHtabbar.deleagte = self;
    }
    return _MHtabbar;
}
#pragma mark - 代理
-(void)tabBar:(MHTabBar *)tabBar clickButton:(MHItemType)idx{
    
    if (idx != MHItemTypelaunch) {
        self.selectedIndex = idx - MHItemTypeLive;
        return;
    }
    MHLaunchViewController *vc = [[MHLaunchViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];

}



@end
