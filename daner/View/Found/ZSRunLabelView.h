//
//  ZSRunLabelView.h
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSRunLabelView : UIView
//字体颜色
@property (nonatomic, strong) UIColor *textColor;

//字体大小
@property (nonatomic, strong) UIFont *font;

//要显示的内容
@property (nonatomic, strong) NSString *text;

/**
 移动的速度[0~1],默认是0.2
 */
@property (nonatomic, assign) CGFloat speed;
@end

NS_ASSUME_NONNULL_END
