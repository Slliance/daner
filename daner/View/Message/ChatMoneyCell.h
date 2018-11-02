//
//  ChatMoneyCell.h
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatMoneyCell : BaseTableViewCell
@property(nonatomic,strong)UIView *BGView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *reviewerBtn;
@property(nonatomic,strong)UIImageView *BGImage;
@property(nonatomic,strong)UILabel *moneyLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@end

NS_ASSUME_NONNULL_END
