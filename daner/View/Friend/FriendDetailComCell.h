//
//  FriendDetailComCell.h
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendDetailComCell : BaseTableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)UIImageView *rightBtn;
@property(nonatomic,strong)NSString *imageName;


@end

NS_ASSUME_NONNULL_END
