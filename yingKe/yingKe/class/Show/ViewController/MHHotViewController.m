//
//  MHHotViewController.m
//  yingKe
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHHotViewController.h"
#import "MHLiveHandler.h"

@interface MHHotViewController ()
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation MHHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

  return   self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;

}
- (NSMutableArray *)dataList{
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
- (void)loadData{
    [MHLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];

}
- (void)initUI{

}























@end
