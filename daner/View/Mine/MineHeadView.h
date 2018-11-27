//
//  MineHeadView.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseView.h"
#import "DNMineDataassetsView.h"
#import "DNShareOutbonusView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineHeadView : BaseView
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *bgImage;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *moreBtn;
@property(nonatomic,strong)UIButton *fouceBtn;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *vImage;
@property(nonatomic,strong)UILabel *fouceNumLabel;
@property(nonatomic,strong)UILabel *fouceTitleLabel;
@property(nonatomic,strong)UILabel *fansNumLabel;
@property(nonatomic,strong)UILabel *fansTitleLabel;
@property(nonatomic,strong)UILabel *zanNumLabel;
@property(nonatomic,strong)UILabel *zanTitleLabel;
@property(nonatomic,strong)UILabel *hateNumLabel;
@property(nonatomic,strong)UILabel *hateTitleLabel;
@property(nonatomic,strong)UILabel *friendNumLabel;
@property(nonatomic,strong)UILabel *friendTitleLabel;
@property(nonatomic,strong)UIButton *moreSortBtn;
@property(nonatomic,strong)UILabel *assetsTitleLabel;

@property(nonatomic,strong)UILabel *DNumLabel;
@property(nonatomic,strong)UILabel *DTitleLabel;
@property(nonatomic,strong)UILabel *integralNumLabel;
@property(nonatomic,strong)UILabel *integralTitleLabel;
@property(nonatomic,strong)UILabel *moneyNumLabel;
@property(nonatomic,strong)UILabel *moneyTitleLabel;
@property(nonatomic,strong)UILabel *line1;
@property(nonatomic,strong)DNMineDataassetsView*assetsView;
@property(nonatomic,strong)DNShareOutbonusView*shareOutView;

@property(nonatomic,copy)void (^backBlcok)(void);

@end

NS_ASSUME_NONNULL_END
