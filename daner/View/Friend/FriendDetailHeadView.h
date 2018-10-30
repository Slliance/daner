//
//  FriendDetailHeadView.h
//  daner
//
//  Created by dnaer7 on 2018/10/30.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendDetailHeadView : BaseView
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UIButton *sexBtn;
///星座
@property(nonatomic,strong)UIButton *constellateBtn;
@property(nonatomic,strong)UIButton *cityBtn;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *vImage;
@property(nonatomic,strong)UILabel *line1;


@end

NS_ASSUME_NONNULL_END
