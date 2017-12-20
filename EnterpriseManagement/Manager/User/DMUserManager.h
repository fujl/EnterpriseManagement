//
//  DMUserManager.h
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#import <AppManager/AppManager.h>
#import "DMLoginInfo.h"

/**
 用户登录、登出变化监听
 */
@protocol OnUserChangeDelegate <NSObject>

@optional

- (void)onUserWillLogin;
- (void)onUserDidLogin;

// 用户登出了
- (void)onUserLogout;

@end

@interface DMUserManager : AppBaseManager

/** 用户是否登陆: 是否存在用户 */
@property(nonatomic, readonly) BOOL isNeedLogin;
/** 当前的用户信息 */
@property(nonatomic, readonly) DMLoginInfo *loginInfo;

/** 设备token */
@property(nonatomic, strong) NSString *deviceToken;

/** 添加用户登录、登出的监听 */
- (void)addOnUserChangeDelegate:(id <OnUserChangeDelegate>)delegate;
- (void)removeOnUserChangeDelegate:(id <OnUserChangeDelegate>)delegate;

- (void)login:(NSString *)username password:(NSString *)password callback:(void (^)(DMResultCode code, NSString *errMsg))callback;

- (void)logout:(void (^)(DMResultCode code, NSString *errMsg))callback;

- (void)autoLogin:(void (^)(DMResultCode code))callback;

- (void)bindPush;

- (void)startMainController;

- (void)startLoginController;

@end
