//
//  NSString+XDRegExp.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/10.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "NSString+XDRegExp.h"

@implementation NSString (XDRegExp)

#pragma mark - ------ Public Methods ------

/// 邮箱
- (BOOL)xd_isMail {
    
    NSString *emailRegexp = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self baseWithRegExp:emailRegexp];
}

/// 手机号
- (BOOL)xd_isMobile {
    
    if (self.length != 11) {
        return NO;
    }
    NSString *moblieRegexp = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    return [self baseWithRegExp:moblieRegexp];
}

/// 是否只有中文
- (BOOL)xd_isOnlyChinese {
    
    NSString *moblieRegexp = @"^[\u4e00-\u9fa5]{0,}$";
    return [self baseWithRegExp:moblieRegexp];
}

/// 是否只有数字
- (BOOL)xd_isOnlyNumber {
    
    NSString *moblieRegexp = @"^[0-9]*$";
    return [self baseWithRegExp:moblieRegexp];
}

/// 是否是身份证
- (BOOL)xd_isIDCard {
    
    NSString *idCard = @"";
    if (self.length == 15) {
        idCard = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    } else {
        idCard = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    }
    
    return [self baseWithRegExp:idCard];
}

/// 是否是银行卡号
- (BOOL)xd_isBankCard {
    
    NSString *bankCard = @"^(\\d{16}|\\d{19})$";
    return [self baseWithRegExp:bankCard];
}

#pragma mark - ------ Private Methods ------

- (BOOL)baseWithRegExp:(NSString *)regexp {
    
    if (self.length <= 0 || self == nil) {
        return NO;
    }
    
    if (regexp.length <= 0 || regexp == nil) {
        return NO;
    }
    
    NSPredicate *idCard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexp];
    return [idCard evaluateWithObject:self];
}

/*----------------------------- 沙盒 ------------------------------*/

/// 获取Documents目录
+ (NSString *)xd_documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

/// 获取拼接后的Documents目录
- (NSString *)xd_appendDocumentsPath {
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [self lastPathComponent];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}

/// 获取Cache目录
+ (NSString *)xd_cachePath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

/// 获取拼接后的Cache目录
- (NSString *)xd_appendCachePath {
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [self lastPathComponent];
    NSString *filePath = [cachePath stringByAppendingPathComponent:fileName];
    
    return filePath;
}



/// 获取Tmp目录
+ (NSString *)xd_tempPath {
    return NSTemporaryDirectory();
}

/// 获取拼接后的Tmp目录
- (NSString *)xd_appendTmpPath {
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *fileName = [self lastPathComponent];
    NSString *filePath = [tmpPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}

@end
