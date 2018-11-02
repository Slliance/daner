//
//  ChatPictureCell.h
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatPictureCell : BaseTableViewCell
@property(nonatomic,strong)UIView *BGView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *reviewerBtn;
@property(nonatomic,strong)UIImageView *BGImage;
@property(nonatomic,strong)UILabel *locLabel;

@end

NS_ASSUME_NONNULL_END
