//
//  EMHttpRequester.m
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#import "EMHttpRequester.h"
#import "EMHttpManager.h"

@implementation EMHttpRequester

- (void)doRequest:(void (^)(AMResultCode code, id data))resultListener {
    if (!_delegate) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"请设置请求的delegate回调" userInfo:nil];
    }
    AMNetworkManager *netWorkManager = getManager(AMNetworkManager);
    if(![netWorkManager hasNet]){
        resultListener(ResultCodeNetError,nil);
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@%@", [[EMConfig mainConfig] getServerUrl], [_delegate getChildrenUrl]];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self putPublicParams:params];
    // 放入接口请求参数
    [_delegate onPutParams:params];
    EMHttpManager *httpManager = getManager([EMHttpManager class]);
    NSLog(@"get request, url = %@?param=%@\n", url, params);
    [httpManager getDataFromServer:url withParams:params completeHandler:^(BOOL isSuccess, NSData *data) {
        NSLog(@"get response, url = %@, isSuccess = %@, data = %@\n", url, isSuccess ? @"true" : @"false", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        [self requestCompleteHandler:isSuccess data:data resultListener:resultListener delegate:_delegate];
    }];
}

- (void)doRequest:(void (^)(AMResultCode, id data))resultListener withDelay:(NSTimeInterval)delayTime {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayTime * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self doRequest:resultListener];
    });
}

- (void)requestCompleteHandler:(BOOL)isSuccess
                          data:(id)data
                resultListener:(void (^)(AMResultCode code, id data))resultListener
                      delegate:(id <EMRequesterDelegate>) delegate {
    if (isSuccess) {
        NSDictionary *resultData = [AMJson getJsonObjectFormData:data];
        int code = [resultData[@"errCode"] intValue];
        id dumpData = nil;
        if (code == ResultCodeOK) {
            dumpData = [delegate onDumpData:resultData];
        } else {
            if ([delegate respondsToSelector:@selector(onDumpErrorData:)]) {
                dumpData = [delegate onDumpErrorData:resultData];
            }
        }
        if (code == ResultCodeAuthenticationFailure) {
            if ([[delegate getChildrenUrl] isEqualToString:@"api/isLogin.do"]) {
                resultListener(code, dumpData);
            } else {
                EMUserManager *userManager = getManager([EMUserManager class]);
                [userManager autoLogin:^(AMResultCode code) {
                    if (code == ResultCodeOK) {
                        [userManager startMainController];
                    } else {
                        [userManager startLoginController];
                    }
                }];
            }
        } else {
            resultListener(code, dumpData);
        }
    } else {
        // 网络不给力
        resultListener(ResultCodeTimeOut, nil);
    }
}

- (void)postRequest:(void (^)(AMResultCode code, id data))resultListener {
    if (!_delegate) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"请设置请求的delegate回调" userInfo:nil];
    }
    AMNetworkManager *netWorkManager = getManager([AMNetworkManager class]);
    if(![netWorkManager hasNet]){
        resultListener(ResultCodeNetError,nil);
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@%@", [[EMConfig mainConfig] getServerUrl], [_delegate getChildrenUrl]];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self putPublicParams:params];
    // 放入接口请求参数
    [_delegate onPutParams:params];
    EMHttpManager *httpManager = getManager([EMHttpManager class]);
    EMUserManager *userManager = getManager([EMUserManager class]);
    NSLog(@"post request, onPostJson：%d url = %@?param=%@\n", [_delegate onPostJson], url, params);
    if (userManager.isNeedLogin || ![_delegate onPostJson]) {
        [httpManager postDataToServer:url withParams:params completeHandler:^(BOOL isSuccess, NSData *data) {
            NSLog(@"post response, url = %@, isSuccess = %@, data = %@\n", url, isSuccess ? @"true" : @"false", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            [self requestCompleteHandler:isSuccess data:data resultListener:resultListener delegate:_delegate];
        }];
    } else {
        [httpManager postDataToServer:url withJsonObjectParams:params withHeaders:@{@"token":userManager.loginInfo.accessToken} completeHandler:^(BOOL isSuccess, NSData *data) {
            NSLog(@"post response, url = %@, isSuccess = %@, data = %@\n", url, isSuccess ? @"true" : @"false", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            [self requestCompleteHandler:isSuccess data:data resultListener:resultListener delegate:_delegate];
        }];
    }
}

#pragma mark - private method
- (void)putPublicParams:(NSMutableDictionary *)params {
    EMUserManager *userManager = getManager([EMUserManager class]);
    if (!userManager.isNeedLogin) {
        params[@"userId"] = userManager.loginInfo.userId;
        params[@"token"] = userManager.loginInfo.accessToken;
    }
}

@end
