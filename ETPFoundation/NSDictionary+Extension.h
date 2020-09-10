//
//  NSDictionary+Extension.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

-(NSString *)jsonString;

//json 转 字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
