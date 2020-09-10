//
//  UIImageView+ETPWebImage.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/9.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ETPWebImage)

-(void)etp_setImageWithName:(NSString *)imgName placeholderImageString:(NSString *)placeholderImageName;

-(void)etp_setImageWithName:(NSString *)imgName;
    
@end

NS_ASSUME_NONNULL_END
