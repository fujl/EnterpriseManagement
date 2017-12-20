//
//  EMManager.m
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#import "EMManager.h"
#import "EMHttpManager.h"

@implementation EMManager

+ (void)registerManager:(NSMutableArray<Class> *)managers {
    [managers addObject:[EMHttpManager class]];    // 网络请求
    [managers addObject:[EMUserManager class]]; // 用户管理类
}

@end
