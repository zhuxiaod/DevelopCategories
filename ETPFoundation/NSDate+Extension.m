//
//  NSDate+Extension.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/8.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

//字符串转时间
+(NSDate *)etp_toDate:(NSString *)dateString{
    if(dateString.length > 10){
        dateString =  [dateString substringToIndex:10];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *birthdayDate = [dateFormatter dateFromString:dateString];
    return birthdayDate;
}

+(NSString *)etp_toDay{
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd EEE"];
    NSString*dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;

}

///  根据给定的日期格式生成当前时间格式化字符串
+ (NSString *)xd_currentDateWithFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

/// 传给后台的时间字符串
+ (NSString *)xd_currentDateStr {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}


/// 将时间戳转换成时间格式
+ (NSString *)xd_timeWithTimestamp:(NSString *)timestamp {
    
    // 格式化时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}


/// 判断是否是今天
- (BOOL)xd_isToday {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | kCFCalendarUnitMinute;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

/// 小时
+ (NSInteger)xd_hour {
    
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitHour;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];
    NSInteger hour = [dateComponent hour];
    return hour;
}


/// 分钟
+ (NSInteger)xd_minute {
    
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitMinute;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];
    
    NSInteger hour = [dateComponent minute];
    
    return hour;
}

/// 秒
+ (NSInteger)xd_second {
    
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitSecond;  // 秒
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];
    
    NSInteger hour = [dateComponent second];
    return hour;
}

/// 天
+ (NSInteger)xd_day {
    
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitDay;  // 秒
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];
    
    NSInteger hour = [dateComponent day];
    return hour;
}


/// 当前时间戳
+ (NSInteger)xd_getTimestamp{
    
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval interval = [dat timeIntervalSince1970];
    NSInteger time = round(interval);
    
    return time;
}


@end
