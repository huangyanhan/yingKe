//
//  MHHotViewController.m
//  yingKe
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHHotViewController.h"
#import "MHLiveHandler.h"
#import "MHLiveTableViewCell.h"
#import "MHLive.h"
#import "MHPlayerViewController.h"
static NSString *indentifi = @"MHLiveTableViewCell";

@interface MHHotViewController ()
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation MHHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
    
}
#pragma mark - 方法
- (void)loadData{
    [MHLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];
    
}
- (void)initUI{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MHLiveTableViewCell" bundle:nil] forCellReuseIdentifier:indentifi];
    
}


#pragma mark - 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

  return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MHLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifi];
    cell.live = self.dataList[indexPath.row];
    
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MHLive *live = self.dataList[indexPath.row];
    MHPlayerViewController *playerVC = [[MHPlayerViewController alloc]init];
    playerVC.live = live;
//    playerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:playerVC animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70 + SCREEN_WIDTH;
}
#pragma mark - 懒加载
- (NSMutableArray *)dataList{
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}






















@end
