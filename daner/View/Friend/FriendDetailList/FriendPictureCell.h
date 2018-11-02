//
//  FriendPictureCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendPictureCell : BaseTableViewCell
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIImageView *BGImage;

@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *countLabel;
@end

NS_ASSUME_NONNULL_END
