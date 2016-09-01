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

}
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
- (MHTabBar *)MHtabbar
{
    if (!_MHtabbar) {
        
        _MHtabbar = [[MHTabBar alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 49)];
        _MHtabbar.deleagte = self;
    }
    return _MHtabbar;
}
-(void)tabBar:(MHTabBar *)tabBar clickButton:(MHItemType)idx{
    
}



@end
