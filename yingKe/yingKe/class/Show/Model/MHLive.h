//
//  MHLive.h
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHCreator.h"

@interface MHLive : NSObject


@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) MHCreator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

@end
