//
//  MJExtensionConfig.m
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MHCreator.h"
#import "MHLive.h"

@implementation MJExtensionConfig

+ (void)load{
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    [MHCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"description"
                 };
    }];
    //驼峰转下滑线
    [MHCreator mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    [MHLive mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];



}

@end
