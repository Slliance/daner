//
//  FriendTextCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendTextCell : BaseTableViewCell
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@end

NS_ASSUME_NONNULL_END
