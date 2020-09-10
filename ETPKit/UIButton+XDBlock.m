//
//  UIButton+LCBase.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIButton+XDBlock.h"
#import "objc/runtime.h"

@interface UIButton ()

@property (nonatomic, copy) void(^xd_block)(UIButton *);

@end


@implementation UIButton(XDBlock)

- (void)setXd_block:(void (^)(UIButton *))xd_block {
    objc_setAssociatedObject(self, @selector(xd_block), xd_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton *))xd_block {
    return objc_getAssociatedObject(self, @selector(xd_block));
}


- (void)onClick:(UIButton *)btn {
    
    if (self.xd_block) {
        self.xd_block(btn);
    }
}

- (void)xd_addTouchUpInsideBlock:(void (^)(UIButton *))block {
    
    self.xd_block = block;
    [self addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
}


@end
