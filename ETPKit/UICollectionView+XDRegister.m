//
//  UICollectionView+LCRegister.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UICollectionView+XDRegister.h"

@implementation UICollectionView (XDRegister)

/// 注册 header
- (void)xd_registerHeaderViewWithNibName:(Class)cellClass {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(cellClass)];
}

/// 注册 cell
- (void)xd_registerNibName:(Class)cellClass {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}


/// 注册 cell
- (void)xd_registerNibName:(Class)cellClass reuseIdentifier:(NSString *)identifier {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:identifier];
}


@end
