//
//  DanerTabBarItem.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DanerTabBarItem.h"

@implementation DanerTabBarItem
- (UIImage *)unselectedImage{
    return self.image;
}

//半透白框撑满，如不需请隐藏该方法
- (UIEdgeInsets)imageInsets{
    return UIEdgeInsetsMake(10, 0, 0, 0);
}

@end
