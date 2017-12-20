//
//  EMManager.m
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#import "EMManager.h"
#import "DMHttpManager.h"
#import "DMAddressManager.h"
#import "DMDBManager.h"
#import "DMDBCommonManager.h"
#import "DMHttpManager.h"
#import "DMPushManager.h"

@implementation EMManager

+ (void)registerManager:(NSMutableArray<Class> *)managers {
    [managers addObject:[DMHttpManager class]];    // 网络请求
    [managers addObject:[DMUserManager class]]; // 用户管理类
    [managers addObject:[DMDBManager class]]; // 数据库管理
    [managers addObject:[DMDBCommonManager class]];
    [managers addObject:[DMAddressManager class]];    // 地址管理
    [managers addObject:[DMPushManager class]];    // 推送管理
}

@end
