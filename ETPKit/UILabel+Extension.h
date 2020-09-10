//
//  UILabel+Extention.h
//  EnglishTeacherPlatform
//
//  Created by MissSunRise on 2020/9/5.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extension)

//快速创建
+(instancetype)creatLabWithText:(NSString *)text fontSize:(CGFloat)fontSize;

/**
 快速实例化 UILabel
 
 @param text        文字
 @return UILabel 默认字体 16，默认颜色 [UIColor darkTextColor]，默认对齐方式 Left
 */
+ (nonnull UILabel *)xd_labelWithText:(nullable NSString *)text;

/**
 快速实例化 UILabel
 
 @param text        文字
 @param fontSize    字体大小
 @return UILabel 默认颜色 [UIColor darkTextColor]，默认对齐方式 Left
 */
+ (nonnull UILabel *)xd_labelWithText:(nullable NSString *)text
                             fontSize:(CGFloat)fontSize;


/**
 快速实例化 UILabel
 
 @param text        文字
 @param fontSize    字体大小
 @param textColor   字体颜色
 @return UILabel 默认对齐方式 Left
 */
+ (nonnull UILabel *)xd_labelWithText:(nullable NSString *)text
                             fontSize:(CGFloat)fontSize
                            textColor:(nonnull UIColor *)textColor;


/**
 快速实例化 UILabel
 
 @param text        文字
 @param fontSize    字体大小
 @param textColor   字体颜色
 @param alignment   对齐方式
 @return  UILabel
 */
+ (nonnull UILabel *)xd_labelWithText:(NSString *)text
                             fontSize:(CGFloat)fontSize
                            textColor:(UIColor *)textColor
                            alignment:(NSTextAlignment)alignment;


/**
 改变 label 行间距
 
 @param space 间距离
 */
- (void)xd_changeLineSpace:(float)space;


/**
 修改 label 字间距
 
 @param space 间距离
 */
- (void)xd_changeWordSpace:(float)space;


/**
 改变字间距 行间距
 
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
- (void)xd_changeLineSpace:(float)lineSpace wordSpace:(float)wordSpace;


@end

NS_ASSUME_NONNULL_END
