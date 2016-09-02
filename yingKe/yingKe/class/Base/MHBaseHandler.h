//
//  MHBaseHandler.h
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  处理完成事件
 */
typedef void(^completeBlock)();
/**
 *  成功
 *
 *  @param idx 返回的值
 */
typedef void(^successBlock)(id obj);
/**
 *  失败
 *
 *  @param idx 返回值
 */
typedef void(^failedBlock)(id obj);

@interface MHBaseHandler : NSObject

@end
