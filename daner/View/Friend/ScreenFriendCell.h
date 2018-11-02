//
//  ScreenFriendCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/29.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScreenFriendCell : BaseTableViewCell
@property(nonatomic,strong)UIButton *reviewerBtn;
@property(nonatomic,strong)UILabel *reviewerName;
@property(nonatomic,strong)UILabel *lineLabel;
@end

NS_ASSUME_NONNULL_END
