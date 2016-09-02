//
//  MHLiveHandler.m
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHLiveHandler.h"
#import "HttpTool.h"
#import "MHLive.h"


@implementation MHLiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(successBlock)success failed:(failedBlock)failed{
   [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
    
       if ([json[@"dm_error"] integerValue]) {
           failed(json);

       }else
       {//成功后执行
           
          NSArray *lives = [MHLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
           
           success(lives);

       }
       
    } failure:^(NSError *error) {
        
        failed(error);
    }];
}

@end
