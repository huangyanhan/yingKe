//
//  MHLiveHandler.h
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHBaseHandler.h"

@interface MHLiveHandler : MHBaseHandler
/**
 *  获取热门直播信息
 *
 *  @param success
 *  @param failed
 */
+ (void)executeGetHotLiveTaskWithSuccess:(successBlock)success failed:(failedBlock)failed;

@end
