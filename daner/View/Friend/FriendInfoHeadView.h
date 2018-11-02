//
//  FriendInfoHeadView.h
//  daner
//
//  Created by dnaer7 on 2018/10/30.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendInfoHeadView : BaseView
@property(nonatomic,strong)UIImageView *bgImage;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *moreBtn;
@property(nonatomic,strong)UIButton *fouceBtn;
@property(nonatomic,strong)UIButton *sendBtn;
@property(nonatomic,strong)UIButton *originalBtn;
@property(nonatomic,strong)UIButton *sexBtn;
///星座
@property(nonatomic,strong)UIButton *constellateBtn;
@property(nonatomic,strong)UIButton *cityBtn;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *vImage;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *fouceNumLabel;
@property(nonatomic,strong)UILabel *fouceTitleLabel;
@property(nonatomic,strong)UILabel *fansNumLabel;
@property(nonatomic,strong)UILabel *fansTitleLabel;
@property(nonatomic,strong)UILabel *zanNumLabel;
@property(nonatomic,strong)UILabel *zanTitleLabel;
@property(nonatomic,strong)UILabel *hateNumLabel;
@property(nonatomic,strong)UILabel *hateTitleLabel;
///橱柜
@property(nonatomic,strong)UIImageView *ambryImage;
@property(nonatomic,strong)UILabel *ambryLabel;
@property(nonatomic,strong)UIImageView *urlImage;
@property(nonatomic,strong)UILabel *urlLabel;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)UILabel *line2;
@property(nonatomic,strong)UILabel *line3;
@property(nonatomic,strong)UILabel *line4;
@property(nonatomic,strong)UIImageView *rightImage;
@property(nonatomic,copy)void (^backBlcok)(void);


@end

NS_ASSUME_NONNULL_END
