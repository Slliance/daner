//
//  ZSConfig.h
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#ifndef ZSConfig_h
#define ZSConfig_h
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
/**屏幕尺寸*/
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
/**封装颜色*/
#define DSColorMake(r, g, b)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define DSColorAlphaMake(r, g, b, a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define DSColorFromHex(rgb)     [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]
#define DSColorAlphaFromHex(rgb,a)     [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:a]
#define DSNavi  [UIColor whiteColor] //navigation的颜色
#define FONT_PingFangSC_Medium(x) [UIFont fontWithName:@"PingFangSC-Regular" size:x]?[UIFont fontWithName:@"PingFangSC-Regular" size:x]:[UIFont systemFontOfSize:x]
#define FONT_PingFang_SC_Medium(x) [UIFont fontWithName:@"PingFangSC-Regular" size:x]?[UIFont fontWithName:@"PingFangSC-Regular" size:x]:[UIFont systemFontOfSize:x]
#define FONT_PingFangSC_Bold(x) [UIFont fontWithName:@"PingFangSC-Semibold" size:x]?[UIFont fontWithName:@"PingFangSC-Semibold" size:x]:[UIFont boldSystemFontOfSize:x]
#define FONT_PingFang_SC_Bold(x) [UIFont fontWithName:@"PingFangSC-Semibold" size:x]?[UIFont fontWithName:@"PingFangSC-Semibold" size:x]:[UIFont boldSystemFontOfSize:x]
#define FONT_PingFang_SC(x) [UIFont fontWithName:@"PingFangSC-Light" size:x]?[UIFont fontWithName:@"PingFangSC-Light" size:x]:[UIFont systemFontOfSize:x]
#define FONT_PingFang_SC_Regular(x) [UIFont fontWithName:@"PingFangSC-Light" size:x]?[UIFont fontWithName:@"PingFangSC-Light" size:x]:[UIFont systemFontOfSize:x]


#import <Masonry/Masonry.h>
#import "UIView+CTExtensions.h"
#import "UILabel+String.h"
#import "MJRefresh.h"



#endif /* ZSConfig_h */
