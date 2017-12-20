//
//  DMAddressManager.h
//  DisciplineManager
//
//  Created by fujl-mac on 2017/6/19.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "DMAddressInfo.h"

@interface DMAddressManager : AppBaseManager

- (void)getAllAddress:(void (^)(NSMutableArray<DMAddressInfo *> *addressList))callback;
- (void)getAddressInfoList:(NSInteger)addressPid callback:(void (^)(NSMutableArray<DMAddressInfo *> *addressList))callback;

@end
