//
//  UIButton+Extention.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)


-(void)buttonAddGradientColorWithColors:(NSArray *)colors{
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    gl.startPoint = CGPointMake(0, 0.5);
    gl.endPoint = CGPointMake(1, 0.5);
    gl.colors = colors;
    gl.locations = @[@(0), @(1.0f)];
    [self.layer insertSublayer:gl atIndex:0];
}
@end
