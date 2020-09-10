//
//  UICollectionView+LCRegister.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (XDRegister)


/**
 注册 xib cell
 
 @param cellClass       cell 类
 */
- (void)xd_registerNibName:(Class)cellClass;


/**
 注册 xib cell
 
 @param cellClass       cell 类
 @param identifier      标示
 */
- (void)xd_registerNibName:(Class)cellClass reuseIdentifier:(NSString *)identifier;


/**
 注册 header
 */
- (void)xd_registerHeaderViewWithNibName:(Class)cellClass;


@end

NS_ASSUME_NONNULL_END
