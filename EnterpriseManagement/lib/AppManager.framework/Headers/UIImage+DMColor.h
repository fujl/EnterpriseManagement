//
//  UIImage+DMColor.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DMColor)

/**
 颜色图片

 @param color 颜色
 @param size 大小
 @return 颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 颜色渐变图片

 @param colors 颜色数组
 @param size 大小
 @return 图片
 */
+ (UIImage *)gradientImageFromColors:(NSArray<UIColor *> *)colors size:(CGSize)size;

@end
