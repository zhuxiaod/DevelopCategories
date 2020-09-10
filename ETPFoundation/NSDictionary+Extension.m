//
//  NSDictionary+Extension.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)


-(NSString *)jsonString
{
    NSError *error = nil;
    //if option is NSJSONWritingPrettyPrinted, the string will be well formated, if pass 0, will not generate "\n \t"
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if (error) {
        return nil;
    }
    NSString *jsonString= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
