//
//  FriendInfoCell.h
//  daner
//
//  Created by dnaer7 on 2018/11/19.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendInfoCell : BaseTableViewCell
///橱柜
@property(nonatomic,strong)UIButton *ambryImage;
@property(nonatomic,strong)UILabel *ambryLabel;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)UIImageView *rightImage;
@end

NS_ASSUME_NONNULL_END
