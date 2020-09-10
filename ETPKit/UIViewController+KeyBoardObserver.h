//
//  UIViewController+KeyBoardObserver.h
//  EnglishTeacherPlatform
//
//  Created by MissSunRise on 2020/9/5.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//结合YYKeyBoardManager封装的一个分类，当控制器中TextField的时候，监听键盘的一个事件，去完成显示/隐藏键盘逻辑

@interface UIViewController (KeyBoardObserver)

//开启监听
-(void)etp_addKeyboardObserver;

//结束监听
-(void)etp_removeKeyboardObserver;

@end

NS_ASSUME_NONNULL_END
