//
//  EMLoginInfo.h
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMLoginInfo : NSObject

/** 用户id */
@property (nonatomic, copy) NSString *userId;

/** 用户名 */
@property (nonatomic, copy) NSString *username;

/** 用户密码 */
@property (nonatomic, copy) NSString *password;

/** 用户token */
@property (nonatomic, copy) NSString *accessToken;

/** 失效时间 */
@property (nonatomic, assign) NSInteger expiresIn;

/** 上次登录时间 */
@property (nonatomic, assign) NSTimeInterval loginDt;

/** createTime */
@property (nonatomic, copy) NSString *createTime;

/** optLock */
@property (nonatomic, assign) NSInteger optLock;

/** orgCodeOriginal */
@property (nonatomic, copy) NSString *orgCodeOriginal;

/** orgCode */
@property (nonatomic, copy) NSString *orgCode;

@end
