//
//  MHMainViewController.m
//  yingKe
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHMainViewController.h"
#import "MHMainTopView.h"

@interface MHMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *controntScrollView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) MHMainTopView *topView;

@end

@implementation MHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];

}
- (void)initUI{
    //添加导航栏
    [self setupNav];
    //添加子控制器
    [self setupChildViewController];
    
}
- (void)setupChildViewController{
    
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:@[@"MHFocuseViewController",@"MHHotViewController",@"MHNearbyViewController"]];
    
    for (NSUInteger i = 0; i < muArray.count; i ++) {
        
        NSString *vcName = muArray[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = _dataList[i];
        [self addChildViewController:vc];
    }
    
    self.controntScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.dataList.count, 0);
    //先进入第二个页面
    self.controntScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    self.controntScrollView.pagingEnabled = YES;
//    self.scrollView.delegate = self;
    
    //进入主控制器加载第一个页面
    [self scrollViewDidEndScrollingAnimation:self.controntScrollView];
    
    
}
- (void)setupNav{
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];

}

#pragma mark - 代理
//动画结束时调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    CGFloat width = SCREEN_WIDTH;
    //    CGFloat width = scrollView.frame.size.width;
    CGFloat height = SCREEN_HEIGHT;
    
    CGFloat offSet = scrollView.contentOffset.x;
    
    //获取索引
    NSInteger idx = offSet/width;
    //根据索引判断VC
    UIViewController *vc = self.childViewControllers[idx];
    //判断当前的VC是不是执行了viewDidLoad
    if ([vc isViewLoaded]) return;
    
    //设置自控制的大小
    //    vc.view.frame = CGRectMake(offSet, 0, width, height);
    vc.view.frame = CGRectMake(offSet, 0,scrollView.frame.size.width, height);//进入第二个页面设置
    
    //将自控制器添加到scrollView
    [scrollView addSubview:vc.view];
    

}
//拖动后减速

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];

    
}
#pragma mark - 懒加载
- (MHMainTopView *)topView{
    
    if (!_topView) {
        
        _topView = [[MHMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.dataList];
        
        @weakify(self)
        _topView.topBlock = ^(NSInteger tag){
            
            @strongify(self)
            CGPoint point = CGPointMake(tag *SCREEN_WIDTH,self.controntScrollView.contentOffset.y);
            
            [self.controntScrollView setContentOffset:point animated:YES];
            
        };
    }
    return _topView;
}
- (NSArray *)dataList{
    if (!_dataList) {
        
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}





























@end
