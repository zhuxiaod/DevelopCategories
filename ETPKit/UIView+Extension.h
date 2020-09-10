//
//  UIView+Extention.h
//  EnglishTeacherPlatform
//
//  Created by MissSunRise on 2020/9/5.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)

//获取控制器
- (UIViewController*)viewController;

//获取根控制器
+ (UIViewController *)etp_getRootViewController;

//获取最上层VC
+ (UIViewController *)etp_findVisibleViewController;

/*----------------------------- layer ------------------------------*/
@property (assign,nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic) IBInspectable BOOL      masksToBounds;
@property (assign,nonatomic) IBInspectable NSInteger borderWidth;
@property (strong,nonatomic) IBInspectable UIColor   *borderColor;


@end

NS_ASSUME_NONNULL_END
