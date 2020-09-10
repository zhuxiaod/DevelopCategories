//
//  UIImageView+ETPWebImage.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/9.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIImageView+ETPWebImage.h"

@implementation UIImageView (ETPWebImage)

-(void)etp_setImageWithName:(NSString *)imgName placeholderImageString:(NSString *)placeholderImageName{
    [self sd_setImageWithURL:etp_dlImg(imgName) placeholderImage:[UIImage imageNamed:placeholderImageName]];
}

-(void)etp_setImageWithName:(NSString *)imgName{
    [self sd_setImageWithURL:etp_dlImg(imgName)];
}



@end
