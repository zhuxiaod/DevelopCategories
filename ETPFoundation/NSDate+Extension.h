//
//  NSDate+Extension.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extension)

//字符串转时间
+(NSDate *)etp_toDate:(NSString *)dateString;


+(NSString *)etp_toDay;

/**
 根据给定的日期格式生成当前时间格式化字符串
 
 @param format      时间格式 例如：'YY-MM-DD HH:MM:SS'
 */
+ (NSString *)xd_currentDateWithFormat:(NSString *)format;


/**
 传给后台的时间字符串
 */
+ (NSString *)xd_currentDateStr;


/**
 将时间戳转换成时间格式
 
 @param timestamp 时间戳
 */
+ (NSString *)xd_timeWithTimestamp:(NSString *)timestamp ;

/**
 判断是否是今天
 */
- (BOOL)xd_isToday;


/**
 获取当前时间的时间戳
 */
+ (NSInteger)xd_getTimestamp;

/**
 获取当前小时
 */
+ (NSInteger)xd_hour;


/**
 获取当前分
 */
+ (NSInteger)xd_minute;

/**
 获取当前天
 */
+ (NSInteger)xd_day;

/**
 获取当前秒
 */
+ (NSInteger)xd_second;


@end

NS_ASSUME_NONNULL_END
