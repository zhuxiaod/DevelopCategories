//
//  UIImage+Extention.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

+(UIImage *)imageOriginalWithName:(NSString *)imageName;

/**
 导航栏渐变图片
 */
+ (UIImage*)xd_gradientImage;


/**
 *  获取矩形的渐变色的UIImage
 *
 *  @param bounds           UIImage的bounds
 *  @param colors           渐变色数组，可以设置两种颜色
 *  @param gradientType     渐变的方式：0--->从上到下   1--->从左到右
 */
+ (UIImage *)xd_gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors andGradientType:(int)gradientType;


/**
 通过 URL 和给定的宽度 获取网络图片大小
 
 @param URL         url
 @param mwidth      宽度
 */
+ (CGSize)xd_getImageSizeWithURL:(id)URL width:(CGFloat)mwidth;




/**
 根据图片名称，生成给定尺寸的圆角图像
 
 @param imgName     图像名称
 @param size        要生成的图像大小
 @param completion  完成回调返回新的图像
 */
+ (void )xd_filletImageWithNamed:(NSString *)imgName
                            size:(CGSize)size
                      completion:(void (^)(UIImage *circleImg))completion;

/*----------------------------- Fillet ------------------------------*/


/**
 根图像名称， 生成给定尺寸的拉伸图像
 
 @param imgName     图像名称
 @param size        图像尺寸
 @param completion  完成回调返回新的图像
 */
+ (void )xd_drawImageWithNamed:(NSString *)imgName
                          size:(CGSize)size
                    completion:(void (^)(UIImage *drawImg))completion;



/**
 根据给定颜色， 生成给定尺寸的纯色图像
 
 @param color       背景颜色
 @param size        尺寸
 @param completion  完成回调返回新的图像
 */
+ (void)xd_pureColorImageWithColor:(UIColor *)color
                              size:(CGSize)size
                        completion:(void (^)(UIImage *pureColorImage))completion;


@end

NS_ASSUME_NONNULL_END
