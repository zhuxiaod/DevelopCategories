//
//  NSString+XDRegExp.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/10.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XDRegExp)


/// 是否是手机号
- (BOOL)xd_isMobile;

/// 是否是邮箱
- (BOOL)xd_isMail;

/// 是否只有中文
- (BOOL)xd_isOnlyChinese;

/// 是否只有数字
- (BOOL)xd_isOnlyNumber;

/// 是否是身份证
- (BOOL)xd_isIDCard;

/// 是否是银行卡号
- (BOOL)xd_isBankCard;


/*----------------------------- 沙盒 ------------------------------*/

/**
 获取Documents目录
 */
+ (NSString *)xd_documentPath;

/**
 获取拼接后的Documents目录
 */
- (NSString *)xd_appendDocumentsPath;

/**
 获取Cache目录
 */
+ (NSString *)xd_cachePath;

/**
 获取拼接后的Cache目录
 */
- (NSString *)xd_appendCachePath;

/**
 获取Tmp目录
 */
+ (NSString *)xd_tempPath;

/**
 获取拼接后的Tmp目录
 */
- (NSString *)xd_appendTmpPath;

@end

NS_ASSUME_NONNULL_END
