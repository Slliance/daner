//
//  MineHeadView.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "MineHeadView.h"
#import "UIButton+Style.h"
#import "FriendInfoCell.h"

@implementation MineHeadView


-(UIImageView *)bgImage{
    if (!_bgImage) {
        _bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 144)];
        _bgImage.image = [UIImage imageNamed:@"other_bg"];
        _bgImage.userInteractionEnabled = YES;
    }
    return _bgImage;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(21, 103, 80, 80)];
        _headImage.image = [UIImage imageNamed:@"2"];
        [_headImage.layer setCornerRadius:40];
        [_headImage.layer setMasksToBounds:YES];
        [_headImage.layer setBorderColor:DSColorFromHex(0xFFFFFF).CGColor];
        [_headImage.layer setBorderWidth:1];
    }
    return _headImage;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"bg_set"] forState:UIControlStateNormal];
        _backBtn.frame = CGRectMake(20, 44, 180, 30);
        [_backBtn addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setImage:[UIImage imageNamed:@"setting_other"] forState:UIControlStateNormal];
        _moreBtn.frame = CGRectMake(SCREENWIDTH-50, 44, 30, 30);
        [_moreBtn addTarget:self action:@selector(pressMore) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}
-(UIButton *)moreSortBtn{
    if (!_moreSortBtn) {
        _moreSortBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreSortBtn setImage:[UIImage imageNamed:@"more_message"] forState:UIControlStateNormal];
        [_moreSortBtn addTarget:self action:@selector(pressMore) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreSortBtn;
}
-(UIButton *)fouceBtn{
    if (!_fouceBtn) {
        _fouceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fouceBtn setBackgroundImage:[UIImage imageNamed:@"qrcode_mine"] forState:UIControlStateNormal];
        [_fouceBtn addTarget:self action:@selector(pressFouces:) forControlEvents:UIControlEventTouchUpInside];
        [_fouceBtn setBackgroundImage:[UIImage imageNamed:@"qrcode_mine"] forState:UIControlStateSelected];
    }
    return _fouceBtn;
}


-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"海的另一边";
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0x464646);
    }
    return _nameLabel;
}
-(UILabel *)assetsTitleLabel{
    if (!_assetsTitleLabel) {
        _assetsTitleLabel = [[UILabel alloc]init];
        _assetsTitleLabel.text = @"我的数据资产";
        _assetsTitleLabel.font = [UIFont boldSystemFontOfSize:16];
        _assetsTitleLabel.textAlignment = NSTextAlignmentLeft;
        _assetsTitleLabel.textColor = DSColorFromHex(0x464646);
    }
    return _assetsTitleLabel;
}
-(UILabel *)fouceNumLabel{
    if (!_fouceNumLabel) {
        _fouceNumLabel = [[UILabel alloc]init];
        _fouceNumLabel.text = @"352";
        _fouceNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _fouceNumLabel.textAlignment = NSTextAlignmentCenter;
        _fouceNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _fouceNumLabel;
}
-(UILabel *)fansNumLabel{
    if (!_fansNumLabel) {
        _fansNumLabel = [[UILabel alloc]init];
        _fansNumLabel.text = @"124";
        _fansNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _fansNumLabel.textAlignment = NSTextAlignmentCenter;
        _fansNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _fansNumLabel;
}
-(UILabel *)zanNumLabel{
    if (!_zanNumLabel) {
        _zanNumLabel = [[UILabel alloc]init];
        _zanNumLabel.text = @"16k";
        _zanNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _zanNumLabel.textAlignment = NSTextAlignmentCenter;
        _zanNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _zanNumLabel;
}
-(UILabel *)hateNumLabel{
    if (!_hateNumLabel) {
        _hateNumLabel = [[UILabel alloc]init];
        _hateNumLabel.text = @"642";
        _hateNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _hateNumLabel.textAlignment = NSTextAlignmentCenter;
        _hateNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _hateNumLabel;
}
-(UILabel *)friendNumLabel{
    if (!_friendNumLabel) {
        _friendNumLabel = [[UILabel alloc]init];
        _friendNumLabel.text = @"131";
        _friendNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _friendNumLabel.textAlignment = NSTextAlignmentCenter;
        _friendNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _friendNumLabel;
}
-(UILabel *)DNumLabel{
    if (!_DNumLabel) {
        _DNumLabel = [[UILabel alloc]init];
        _DNumLabel.text = @"560.21";
        _DNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _DNumLabel.textAlignment = NSTextAlignmentLeft;
        _DNumLabel.textColor = COLHEX(@"#464646");
    }
    return _DNumLabel;
}
-(UILabel *)integralNumLabel{
    if (!_integralNumLabel) {
        _integralNumLabel = [[UILabel alloc]init];
        _integralNumLabel.text = @"421";
        _integralNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _integralNumLabel.textAlignment = NSTextAlignmentLeft;
        _integralNumLabel.textColor = COLHEX(@"#464646");
    }
    return _integralNumLabel;
}
-(UILabel *)moneyNumLabel{
    if (!_moneyNumLabel) {
        _moneyNumLabel = [[UILabel alloc]init];
        _moneyNumLabel.text = @"6421.05";
        _moneyNumLabel.font = [UIFont boldSystemFontOfSize:16];
        _moneyNumLabel.textAlignment = NSTextAlignmentLeft;
        _moneyNumLabel.textColor = COLHEX(@"#464646");
    }
    return _moneyNumLabel;
}
-(UILabel *)fouceTitleLabel{
    if (!_fouceTitleLabel) {
        _fouceTitleLabel = [[UILabel alloc]init];
        _fouceTitleLabel.text = @"关注";
        _fouceTitleLabel.font = [UIFont systemFontOfSize:12];
        _fouceTitleLabel.textAlignment = NSTextAlignmentCenter;
        _fouceTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _fouceTitleLabel;
}
-(UILabel *)fansTitleLabel{
    if (!_fansTitleLabel) {
        _fansTitleLabel = [[UILabel alloc]init];
        _fansTitleLabel.text = @"粉丝";
        _fansTitleLabel.font = [UIFont systemFontOfSize:12];
        _fansTitleLabel.textAlignment = NSTextAlignmentCenter;
        _fansTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _fansTitleLabel;
}
-(UILabel *)zanTitleLabel{
    if (!_zanTitleLabel) {
        _zanTitleLabel = [[UILabel alloc]init];
        _zanTitleLabel.text = @"获赞";
        _zanTitleLabel.font = [UIFont systemFontOfSize:12];
        _zanTitleLabel.textAlignment = NSTextAlignmentCenter;
        _zanTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _zanTitleLabel;
}
-(UILabel *)hateTitleLabel{
    if (!_hateTitleLabel) {
        _hateTitleLabel = [[UILabel alloc]init];
        _hateTitleLabel.text = @"群组";
        _hateTitleLabel.font = [UIFont systemFontOfSize:12];
        _hateTitleLabel.textAlignment = NSTextAlignmentCenter;
        _hateTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _hateTitleLabel;
}
-(UILabel *)friendTitleLabel{
    if (!_friendTitleLabel) {
        _friendTitleLabel = [[UILabel alloc]init];
        _friendTitleLabel.text = @"好友";
        _friendTitleLabel.font = [UIFont systemFontOfSize:12];
        _friendTitleLabel.textAlignment = NSTextAlignmentCenter;
        _friendTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _friendTitleLabel;
}
-(UILabel *)DTitleLabel{
    if (!_DTitleLabel) {
        _DTitleLabel = [[UILabel alloc]init];
        _DTitleLabel.text = @"DNAER币";
        _DTitleLabel.font = [UIFont systemFontOfSize:12];
        _DTitleLabel.textAlignment = NSTextAlignmentLeft;
        _DTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _DTitleLabel;
}
-(UILabel *)integralTitleLabel{
    if (!_integralTitleLabel) {
        _integralTitleLabel = [[UILabel alloc]init];
        _integralTitleLabel.text = @"DNAER积分";
        _integralTitleLabel.font = [UIFont systemFontOfSize:12];
        _integralTitleLabel.textAlignment = NSTextAlignmentLeft;
        _integralTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _integralTitleLabel;
}
-(UILabel *)moneyTitleLabel{
    if (!_moneyTitleLabel) {
        _moneyTitleLabel = [[UILabel alloc]init];
        _moneyTitleLabel.text = @"我的现金";
        _moneyTitleLabel.font = [UIFont systemFontOfSize:12];
        _moneyTitleLabel.textAlignment = NSTextAlignmentLeft;
        _moneyTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _moneyTitleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"DNAER ID: 423-652";
        _detailLabel.font = [UIFont systemFontOfSize:10];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.textColor = DSColorFromHex(0x959595);
    }
    return _detailLabel;
}
-(UIImageView *)vImage{
    if (!_vImage) {
        _vImage = [[UIImageView alloc]init];
        _vImage.image = [UIImage imageNamed:@"V"];
        _vImage.userInteractionEnabled = YES;
    }
    return _vImage;
}

-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, 404)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
-(DNMineDataassetsView *)assetsView{
    if (!_assetsView) {
        _assetsView = [[DNMineDataassetsView alloc]init];
    }
    return _assetsView;
}
-(DNShareOutbonusView *)shareOutView{
    if (!_shareOutView) {
        _shareOutView = [[DNShareOutbonusView alloc]init];
    }
    return _shareOutView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =COLHEX(@"#F0F0F0");
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.bgImage];
        [self.bgView addSubview:self.backBtn];
        [self.bgView addSubview:self.moreBtn];
        [self.bgView addSubview:self.headImage];
        [self.bgView addSubview:self.nameLabel];
        [self.bgView addSubview:self.detailLabel];
        [self.bgView addSubview:self.line1];
       
        [self.bgView addSubview:self.fouceNumLabel];
        [self.bgView addSubview:self.fouceTitleLabel];
        [self.bgView addSubview:self.fansNumLabel];
        [self.bgView addSubview:self.fansTitleLabel];
        [self.bgView addSubview:self.zanTitleLabel];
        [self.bgView addSubview:self.zanNumLabel];
        [self.bgView addSubview:self.hateTitleLabel];
        [self.bgView addSubview:self.hateNumLabel];
        [self.bgView addSubview:self.fouceBtn];
        [self.bgView addSubview:self.friendNumLabel];
        [self.bgView addSubview:self.friendTitleLabel];
        [self.bgView addSubview:self.moreSortBtn];
        [self.bgView addSubview:self.assetsTitleLabel];
        [self.bgView addSubview:self.DNumLabel];
        [self.bgView addSubview:self.DTitleLabel];
        [self.bgView addSubview:self.integralNumLabel];
        [self.bgView addSubview:self.integralTitleLabel];
        [self.bgView addSubview:self.moneyNumLabel];
        [self.bgView addSubview:self.moneyTitleLabel];
        [self addSubview:self.assetsView];
        [self addSubview:self.shareOutView];
        [self.fouceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_bottom).offset(10);
            make.right.equalTo(self.bgView).offset(-20);
            
        }];
        self.nameLabel.frame = CGRectMake(self.headImage.ctRight+11, self.bgImage.ctBottom+10, 85, 15);
        self.vImage.frame = CGRectMake(self.nameLabel.ctRight+7, self.headImage.ctBottom+17, 14, 14);
        self.detailLabel.frame = CGRectMake(self.headImage.ctRight+11, self.nameLabel.ctBottom+10, 200, 10);
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView).offset(20);
            make.top.equalTo(self.bgView).offset(328);
            make.right.equalTo(self.bgView).offset(-20);
            make.height.mas_equalTo(0.3);
        }];
        self.assetsTitleLabel.frame = CGRectMake(20, self.headImage.ctBottom+41, App_Frame_Width-20, 15);
        self.DNumLabel.frame = CGRectMake(20, self.assetsTitleLabel.ctBottom+30, App_Frame_Width/3-40/3, 12);
        self.DTitleLabel.frame = CGRectMake(20, self.DNumLabel.ctBottom+11, App_Frame_Width/3-40/3, 11);
        self.integralNumLabel.frame = CGRectMake(20+App_Frame_Width/3-40/3, self.assetsTitleLabel.ctBottom+30, App_Frame_Width/3-40/3, 12);
        self.integralTitleLabel.frame = CGRectMake(20+App_Frame_Width/3-40/3, self.integralNumLabel.ctBottom+11, App_Frame_Width/3-40/3, 11);
        self.moneyNumLabel.frame = CGRectMake(20+App_Frame_Width*2/3-80/3, self.assetsTitleLabel.ctBottom+30, App_Frame_Width/3-40/3, 12);
        self.moneyTitleLabel.frame = CGRectMake(20+App_Frame_Width*2/3-80/3, self.moneyNumLabel.ctBottom+11, App_Frame_Width/3-40/3, 11);
        self.friendNumLabel.frame = CGRectMake(0, self.bgImage.ctBottom+203, App_Frame_Width/5, 15);
        self.friendTitleLabel.frame = CGRectMake(0, self.friendNumLabel.ctBottom+10, App_Frame_Width/5, 15);
        self.fouceNumLabel.frame = CGRectMake(App_Frame_Width/5, self.bgImage.ctBottom+203, App_Frame_Width/6, 15);
        self.fouceTitleLabel.frame = CGRectMake(App_Frame_Width/5, self.fouceNumLabel.ctBottom+10, App_Frame_Width/6, 15);
        self.fansNumLabel.frame = CGRectMake(App_Frame_Width*2/5, self.bgImage.ctBottom+203, SCREENWIDTH/6, 15);
        
        self.fansTitleLabel.frame = CGRectMake(App_Frame_Width*2/5, self.fansNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        self.zanNumLabel.frame = CGRectMake(App_Frame_Width*3/5, self.bgImage.ctBottom+203, SCREENWIDTH/6, 15);
        self.zanTitleLabel.frame = CGRectMake(App_Frame_Width*3/5, self.zanNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        self.hateNumLabel.frame = CGRectMake(App_Frame_Width*4/5, self.bgImage.ctBottom+203, SCREENWIDTH/6, 15);
        self.hateTitleLabel.frame = CGRectMake(App_Frame_Width*4/5, self.hateNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        
        self.assetsView.frame = CGRectMake(0, self.bgView.ctBottom+6, App_Frame_Width, 166);
        self.shareOutView.frame = CGRectMake(0, self.assetsView.ctBottom+6, App_Frame_Width, 217);
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*identify = @"FriendInfoCell";
    FriendInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FriendInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    NSArray *imageArr = @[@"info_friend",@"store_othe",@"link_other"];
    NSArray *titleArr = @[@"基础信息",@"商品橱窗",@"www.dnaer.com"];
    [cell.ambryImage setImage:[UIImage imageNamed:imageArr[indexPath.row]] forState:UIControlStateNormal];
    cell.ambryLabel.text = titleArr[indexPath.row];
    if (indexPath.row ==2) {
        cell.ambryLabel.textColor = DSColorFromHex(0x18609C);
        cell.rightImage.hidden = YES;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)pressBack{
    self.backBlcok();
}
-(void)pressMore{
    
}
-(void)pressFouces:(UIButton*)sender{
    sender.selected = !sender.selected;
}


@end
