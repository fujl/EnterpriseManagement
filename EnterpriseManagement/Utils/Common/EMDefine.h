//
//  EMDefine.h
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#ifndef EMDefine_h
#define EMDefine_h

#define  kPageSize  10      // 每页数据

#define  kUserAvatarSize    30

#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE6PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS11 @available(iOS 11.0, *)

#define kDismissPresentController           @"DismissPresentController"

typedef NS_ENUM(NSInteger, DMActivitiState) {
    ACTIVITI_STATE_SAVE                 = 0,                // 审批状态, 保存 未启动流程
    ACTIVITI_STATE_PENDING              = 1,                // 审批状态, 审核中
    ACTIVITI_STATE_COMPLETE             = 2,                // 审批状态, 审批完成 通过
    ACTIVITI_STATE_RATIFIED             = 3,                // 审批状态, 已经批准
    ACTIVITI_STATE_TRANSFERDEALER       = 4,                // 转批
    ACTIVITI_STATE_TIMEOUT              = 5,                // 任务超时
    ACTIVITI_STATE_REJECTED             = 9,               // 审批状态, 审批完成 驳回
};

// 请休假类别 0 请假, 1 休假
typedef NS_ENUM(NSInteger, DMLeaveType) {
    LeaveTypeNone                       = -1,
    LeaveTypeDefault                    = 0,                // 请假
    LeaveTypeVacation                   = 1,                // 休假
};

typedef NS_ENUM(NSUInteger, DMVoteType) {
    DMVoteTypeRadio = 0,
    DMVoteTypeCheckbox
};

typedef NS_ENUM(NSUInteger, RepastType) {
    /**
     * 早餐
     */
    RepastTypeBreakfast,
    /**
     * 午餐
     */
    RepastTypeLunch,
};

typedef NS_ENUM(NSUInteger, NoticeType) {
    NoticeTypeUnread,
    NoticeTypeRead,
    NoticeTypeMine,
};

#ifdef __OBJC__
#define BEGIN_AUTORELEASE        NSAutoreleasePool* __lpPool = [[NSAutoreleasePool alloc] init];
#define END_AUTORELEASE            [__lpPool drain];

#define SAFE_RELEASE(x)    \
if(x)                                   \
{                                       \
[x release];                        \
x = nil;                            \
}
#define SAFE_RELEASE_SET(x)  \
if(x)                                   \
{                                       \
[x removeAllObjects];               \
[x release];                        \
x = nil;                            \
}
#endif

#endif /* EMDefine_h */
