//
//  DMSubmitTaskOutRequester.m
//  DisciplineManager
//
//  Created by fujl-mac on 2017/8/1.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "DMSubmitTaskOutRequester.h"

@interface DMSubmitTaskOutRequester () <DMRequesterDelegate>

@end

@implementation DMSubmitTaskOutRequester

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - HlwyyRequesterDelegate
- (id)onDumpData:(NSDictionary *)jsonObject {
    return jsonObject;
}

- (id)onDumpErrorData:(NSDictionary *)jsonObject {
    return [jsonObject objectForKey:@"errMsg"];
}

- (NSString *)getChildrenUrl {
    return @"jgxt/api/egressionApply/submitTask.do";
}

/**
 *  放入请求的基本参数
 *
 *  @param params 参数容器，注意：里面已经放入基本的请求参数
 */
- (void)onPutParams:(NSMutableDictionary *)params {
    NSString *userId = [params objectForKey:@"userId"];
    [params removeAllObjects];
    params[@"userId"] = userId;
    params[@"id"] = self.businessId;
    params[@"taskId"] = self.taskId;
    params[@"message"] = self.message;
    if (self.leaderId) {
        params[@"leaderId"] = self.leaderId;
    }
    if (self.driverId) {
        params[@"driverId"] = self.driverId;
    }
    if (self.driverName) {
        params[@"driverName"] = self.driverName;
    }
    if (self.officialCarId) {
        params[@"officialCarId"] = self.officialCarId;
    }
    if (self.state != nil) {
        params[@"state"] = self.state;
    }
    
    if (self.isOwnDispatch) {
        params[@"isOwnDispatch"] = self.isOwnDispatch;
    }
}

- (BOOL)onPostJson {
    return YES;
}

@end
