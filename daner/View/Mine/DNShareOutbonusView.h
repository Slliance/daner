//
//  DNShareOutbonusView.h
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNMineCellHeadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNShareOutbonusView : UIView
@property(nonatomic,strong)DNMineCellHeadView *headView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *moneyLabel;
@property (nonatomic, strong)UILabel *unitLabel;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UILabel *totalNum;
@property (nonatomic, strong)UILabel *productLabel;
@property (nonatomic, strong)UILabel *productNum;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)UILabel *xieLine;

@end

NS_ASSUME_NONNULL_END
