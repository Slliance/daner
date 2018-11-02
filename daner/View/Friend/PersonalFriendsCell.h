//
//  PersonalFriendsCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalFriendsCell : BaseTableViewCell
@property(nonatomic,strong)UIImageView *headImage1;
@property(nonatomic,strong)UIImageView *headImage2;
@property(nonatomic,strong)UIImageView *headImage3;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *rightBtn;
@end

NS_ASSUME_NONNULL_END
