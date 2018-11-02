//
//  FriendRecordCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendRecordCell : BaseTableViewCell
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UIImageView *BGImage;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *playBtn;
@property(nonatomic,strong)UILabel *musicLabel;
@property(nonatomic,strong)UIView *bgView;
@end

NS_ASSUME_NONNULL_END
