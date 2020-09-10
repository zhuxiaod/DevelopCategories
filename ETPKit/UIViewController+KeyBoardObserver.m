//
//  UIViewController+KeyBoardObserver.m
//  EnglishTeacherPlatform
//
//  Created by MissSunRise on 2020/9/5.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIViewController+KeyBoardObserver.h"
#import <objc/runtime.h>

@interface UIViewController()<YYKeyboardObserver>

@property(nonatomic,strong)UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation UIViewController (KeyBoardObserver)

-(void)setTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer{
    objc_setAssociatedObject(self, @selector(tapGestureRecognizer), tapGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITapGestureRecognizer *)tapGestureRecognizer{
    return objc_getAssociatedObject(self, _cmd);
}

//开启监听
-(void)etp_addKeyboardObserver{
    [[YYKeyboardManager defaultManager] addObserver:self];
    //一旦开始监听 就添加触摸关闭键盘事件
    //键盘失去响应
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    self.tapGestureRecognizer = tapGestureRecognizer;
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

//这里也有问题
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

//结束监听
-(void)etp_removeKeyboardObserver{
    [[YYKeyboardManager defaultManager] removeObserver:self];
    [self.view removeGestureRecognizer:self.tapGestureRecognizer];
    objc_removeAssociatedObjects(self.tapGestureRecognizer);
}

#pragma mark - @protocol YYKeyboardObserver
- (void)keyboardChangedWithTransition:(YYKeyboardTransition)transition {
    
    //获取当前响应者
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIView *firstResponder = [[UIApplication sharedApplication].keyWindow performSelector:@selector(firstResponder)];
#pragma clang diagnostic pop
    //获取控件所在的View
    UIView *baseView = [firstResponder viewController].view;

    //消失逻辑
    if(transition.fromVisible == YES){
        baseView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        //刷新
        [UIView animateWithDuration:transition.animationDuration animations:^{
            [baseView layoutIfNeeded];
        }];
    }
    
    //出现逻辑
    if (transition.toVisible == YES) {
        //获取键盘高度 keyboardHeight
        CGFloat keyboardHeight = [YYKeyboardManager defaultManager].keyboardView.bounds.size.height;
        
        // Twitter 网络登录时上移问题
        Class clName = NSClassFromString(@"UIWebBrowserView");
        if ([firstResponder isKindOfClass:clName]) return;
        if (![firstResponder respondsToSelector:@selector(center)]) return;
        
        //当前响应者在其父视图的中点(x居中 y最下点)
        CGPoint firstCPoint = CGPointMake(firstResponder.center.x, CGRectGetMaxY(firstResponder.frame));
        //当前响应者在屏幕中的point
        CGPoint convertPoint = [[UIApplication sharedApplication].keyWindow convertPoint:firstCPoint fromView:firstResponder.superview];
        //当前响应者的最大y值
        CGFloat firstRespHeight = convertPoint.y;
        
        CGFloat screenH = [UIScreen mainScreen].bounds.size.height;

        //键盘最高点的y值
        CGFloat topHeighY = screenH - keyboardHeight;//顶部高度的Y值
        if (topHeighY < firstRespHeight) { //键盘挡住了当前响应的控件 需要上移
            CGFloat spaceHeight = firstRespHeight - topHeighY;
            //控制器
            baseView.center = CGPointMake(baseView.center.x, baseView.center.y - spaceHeight);
            [UIView animateWithDuration:transition.animationDuration animations:^{
                [baseView layoutIfNeeded];
            }];
        }else{
            NSLog(@"键盘未挡住输入框");
        }
    }
}
@end
