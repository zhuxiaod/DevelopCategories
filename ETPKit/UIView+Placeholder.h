//
//  UIView+Placeholder.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Placeholder)

/**
 显示网络错误占位图
 */
- (void)xd_showNetworkErrorPlaceholderViewWithReloadBlock:(void(^)(void))reloadBlock;


/**
 显示无数据占位图
 
 @param count 数据个数
 */
- (void)xd_showNoDataPlaceholderViewWithDataCount:(NSInteger)count;


/**
 显示占位图
 
 @param message         显示文字
 @param iconImg         显示图片
 @param reloadBlock     刷新回调
 */
- (void)xd_showPlaceholderViewWithMessage:(NSString *)message
                                  iconImg:(NSString *)iconImg
                              reloadBlock:(void (^)(void))reloadBlock;

@end

NS_ASSUME_NONNULL_END
