//
//  DNFriendPhoneCell.h
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNFriendPhoneCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)UIButton *phoneBtn;
@property(nonatomic,strong)UIButton *videoBtn;
@property(nonatomic,strong)UIButton *messageBtn;

@end

NS_ASSUME_NONNULL_END
