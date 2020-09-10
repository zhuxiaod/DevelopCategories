//
//  UIImage+Extention.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+(UIImage *)imageOriginalWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


#pragma mark - ------ Public Methods ------
///  指定渐变图片
+ (UIImage*)xd_gradientImage {
    
    UIColor *color1 = [UIColor colorWithHexString:@"#fea26e"];
    UIColor *color2 = [UIColor colorWithHexString:@"#ff6668"];
    UIImage *img = [self xd_gradientImageWithBounds:CGRectMake(0, 0, kScreenWidth, 2) andColors:@[color1, color2] andGradientType:1];
    
    return img;
}

/// 通用渐变图片
+ (UIImage*)xd_gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors andGradientType:(int)gradientType{
    
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    
    switch (gradientType) {
        case 0:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, bounds.size.height);
            break;
        case 1:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(bounds.size.width, 0.0);
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}


/// 获取网络图片尺寸
+ (CGSize)xd_getImageSizeWithURL:(id)imageURL width:(CGFloat)mwidth {
    
    if (imageURL == nil) {
        return CGSizeMake(mwidth, 0);
    }
    NSNumber *imgH = [[NSUserDefaults standardUserDefaults] objectForKey:imageURL];
    
    if (!imgH) {
        CGSize imageSize = [self getImageSizeWithURL:imageURL];
        CGFloat imgH = 0;
        if (imageSize.height > 0) {
            imgH = mwidth * imageSize.height / imageSize.width;
        }
        [[NSUserDefaults standardUserDefaults] setObject:@(imgH) forKey:imageURL];
        
        return CGSizeMake(mwidth, imgH);
        
    } else {
        return CGSizeMake(mwidth, [imgH floatValue]);
    }
}


#pragma mark - ------ Private Methods ------

+ (CGSize)getImageSizeWithURL:(id)URL {
    
    NSURL * url = nil;
    if ([URL isKindOfClass:[NSURL class]]) {
        url = URL;
    }
    if ([URL isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:URL];
    }
    if (!URL) {
        return CGSizeZero;
    }
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0, height = 0;
    if (imageSourceRef) {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        //以下是对手机32位、64位的处理
        if (imageProperties != NULL) {
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
#if defined(__LP64__) && __LP64__
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
#else
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat32Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat32Type, &height);
            }
#endif
            CFRelease(imageProperties);
        }
        
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}

/// 通过颜色创建纯色图片
+ (void)xd_pureColorImageWithColor:(UIColor *)color
                              size:(CGSize)size
                        completion:(void (^)(UIImage *))completion {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        // 2. 设置颜色填充
        [color setFill]; // 设置颜色
        UIRectFill(rect); // 填充
        
        // 4. 绘图
        UIImage *image = [UIImage imageNamed:@""];
        [image drawInRect:rect];
        
        // 5. 取到结果
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 7. 回调
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(newImg);
        });
    });
}

/// 创建拉伸图片
+ (void)xd_drawImageWithNamed:(NSString *)imgName
                         size:(CGSize)size
                   completion:(void (^)(UIImage *))completion {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    // 异步操作 执行绘图
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        // 2. 绘图
        UIImage *image = [UIImage imageNamed:imgName];
        [image drawInRect:rect];
        
        // 3. 取到结果
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 4. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 5.  主线程回调
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //执行回调
            completion(newImg);
        });
    });
}

/// 创建圆角图片
+ (void)xd_filletImageWithNamed:(NSString *)imgName
                           size:(CGSize)size
                     completion:(void (^)(UIImage *circleImg))completion {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    // 异步操作 执行绘图
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        // 2. 设置颜色填充
        UIColor *fillColor = [UIColor clearColor];
        [fillColor setFill]; // 设置颜色
        UIRectFill(rect); // 填充
        
        // 3. 圆角裁切
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect]; // 圆角路径
        [path addClip]; // 裁切
        
        // 4. 绘图
        UIImage *image = [UIImage imageNamed:imgName];
        [image drawInRect:rect];
        
        // 5. 取到结果
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 7.  主线程回调
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //执行回调
            completion(newImg);
        });
    });
}

@end
