//
//  FriendVideoCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ZSRunLabelView.h"
NS_ASSUME_NONNULL_BEGIN

@interface FriendVideoCell : BaseTableViewCell
@property(nonatomic,strong)UIImageView *BGImage;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *musicBtn;
@property(nonatomic,strong)ZSRunLabelView *musicLabel;
@property(nonatomic,strong)UIButton *playBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *lineLabel;


@end

NS_ASSUME_NONNULL_END
