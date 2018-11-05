//
//  MineHeadView.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "MineHeadView.h"
#import "UIButton+Style.h"
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
        [_moreBtn setImage:[UIImage imageNamed:@"more_other"] forState:UIControlStateNormal];
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
-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.backgroundColor = [UIColor whiteColor];
        [_sendBtn.layer setCornerRadius:1];
        [_sendBtn setTitle:@"6421 币" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        _sendBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
//        [_sendBtn.layer setBorderColor:DSColorFromHex(0x969696).CGColor];
//        [_sendBtn.layer setBorderWidth:0.5];
        [UIButton changeTextBtn:self.sendBtn
                    stringArray:@[@"6421",@"币"] colorArray:@[DSColorFromHex(0x464646),DSColorFromHex(0x464646)]
                      fontArray:@[[UIFont boldSystemFontOfSize:16],[UIFont systemFontOfSize:12]]];
        
    }
    return _sendBtn;
}
-(UIButton *)integralBtn{
    if (!_integralBtn) {
        _integralBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _integralBtn.backgroundColor = [UIColor whiteColor];
        [_integralBtn.layer setCornerRadius:1];
        [_integralBtn setTitle:@"560 积分" forState:UIControlStateNormal];
        [_integralBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        _integralBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
//        [_integralBtn.layer setBorderColor:DSColorFromHex(0x969696).CGColor];
//        [_integralBtn.layer setBorderWidth:0.5];
        [UIButton changeTextBtn:self.integralBtn
                    stringArray:@[@"560",@"积分"] colorArray:@[DSColorFromHex(0x464646),DSColorFromHex(0x464646)]
                      fontArray:@[[UIFont boldSystemFontOfSize:16],[UIFont systemFontOfSize:12]]];
        
    }
    return _integralBtn;
}
-(UIButton *)originalBtn{
    if (!_originalBtn) {
        _originalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_originalBtn setImage:[UIImage imageNamed:@"selected_other"] forState:UIControlStateNormal];
        _originalBtn.backgroundColor = DSColorFromHex(0xFAFAFA);
        [_originalBtn setTitle:@"原创作者" forState:UIControlStateNormal];
        _originalBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _originalBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [_originalBtn setTitleColor:DSColorFromHex(0x979797) forState:UIControlStateNormal];
        _originalBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return _originalBtn;
}
-(UIButton *)sexBtn{
    if (!_sexBtn) {
        _sexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sexBtn setImage:[UIImage imageNamed:@"male_mine"] forState:UIControlStateNormal];
        _sexBtn.backgroundColor = DSColorFromHex(0xFAFAFA);
        [_sexBtn setTitle:@"25岁" forState:UIControlStateNormal];
        _sexBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _sexBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [_sexBtn setTitleColor:DSColorFromHex(0x979797) forState:UIControlStateNormal];
        _sexBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return _sexBtn;
}
-(UIButton *)constellateBtn{
    if (!_constellateBtn) {
        _constellateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _constellateBtn.backgroundColor = DSColorFromHex(0xFAFAFA);
        [_constellateBtn setTitle:@"摩羯座" forState:UIControlStateNormal];
        [_constellateBtn setTitleColor:DSColorFromHex(0x979797) forState:UIControlStateNormal];
        _constellateBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return _constellateBtn;
}
-(UIButton *)cityBtn{
    if (!_cityBtn) {
        _cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cityBtn.backgroundColor = DSColorFromHex(0xFAFAFA);
        [_cityBtn setTitle:@"上海·闵行" forState:UIControlStateNormal];
        [_cityBtn setTitleColor:DSColorFromHex(0x979797) forState:UIControlStateNormal];
        _cityBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return _cityBtn;
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
-(UILabel *)fouceNumLabel{
    if (!_fouceNumLabel) {
        _fouceNumLabel = [[UILabel alloc]init];
        _fouceNumLabel.text = @"352";
        _fouceNumLabel.font = [UIFont boldSystemFontOfSize:20];
        _fouceNumLabel.textAlignment = NSTextAlignmentCenter;
        _fouceNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _fouceNumLabel;
}
-(UILabel *)fansNumLabel{
    if (!_fansNumLabel) {
        _fansNumLabel = [[UILabel alloc]init];
        _fansNumLabel.text = @"124";
        _fansNumLabel.font = [UIFont boldSystemFontOfSize:20];
        _fansNumLabel.textAlignment = NSTextAlignmentCenter;
        _fansNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _fansNumLabel;
}
-(UILabel *)zanNumLabel{
    if (!_zanNumLabel) {
        _zanNumLabel = [[UILabel alloc]init];
        _zanNumLabel.text = @"16k";
        _zanNumLabel.font = [UIFont boldSystemFontOfSize:20];
        _zanNumLabel.textAlignment = NSTextAlignmentCenter;
        _zanNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _zanNumLabel;
}
-(UILabel *)hateNumLabel{
    if (!_hateNumLabel) {
        _hateNumLabel = [[UILabel alloc]init];
        _hateNumLabel.text = @"642";
        _hateNumLabel.font = [UIFont boldSystemFontOfSize:20];
        _hateNumLabel.textAlignment = NSTextAlignmentCenter;
        _hateNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _hateNumLabel;
}
-(UILabel *)friendNumLabel{
    if (!_friendNumLabel) {
        _friendNumLabel = [[UILabel alloc]init];
        _friendNumLabel.text = @"131";
        _friendNumLabel.font = [UIFont boldSystemFontOfSize:20];
        _friendNumLabel.textAlignment = NSTextAlignmentCenter;
        _friendNumLabel.textColor = DSColorFromHex(0x454545);
    }
    return _friendNumLabel;
}
-(UILabel *)fouceTitleLabel{
    if (!_fouceTitleLabel) {
        _fouceTitleLabel = [[UILabel alloc]init];
        _fouceTitleLabel.text = @"关注";
        _fouceTitleLabel.font = [UIFont systemFontOfSize:13];
        _fouceTitleLabel.textAlignment = NSTextAlignmentCenter;
        _fouceTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _fouceTitleLabel;
}
-(UILabel *)fansTitleLabel{
    if (!_fansTitleLabel) {
        _fansTitleLabel = [[UILabel alloc]init];
        _fansTitleLabel.text = @"粉丝";
        _fansTitleLabel.font = [UIFont systemFontOfSize:13];
        _fansTitleLabel.textAlignment = NSTextAlignmentCenter;
        _fansTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _fansTitleLabel;
}
-(UILabel *)zanTitleLabel{
    if (!_zanTitleLabel) {
        _zanTitleLabel = [[UILabel alloc]init];
        _zanTitleLabel.text = @"获赞";
        _zanTitleLabel.font = [UIFont systemFontOfSize:13];
        _zanTitleLabel.textAlignment = NSTextAlignmentCenter;
        _zanTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _zanTitleLabel;
}
-(UILabel *)hateTitleLabel{
    if (!_hateTitleLabel) {
        _hateTitleLabel = [[UILabel alloc]init];
        _hateTitleLabel.text = @"不喜欢";
        _hateTitleLabel.font = [UIFont systemFontOfSize:13];
        _hateTitleLabel.textAlignment = NSTextAlignmentCenter;
        _hateTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _hateTitleLabel;
}
-(UILabel *)friendTitleLabel{
    if (!_friendTitleLabel) {
        _friendTitleLabel = [[UILabel alloc]init];
        _friendTitleLabel.text = @"好友";
        _friendTitleLabel.font = [UIFont systemFontOfSize:13];
        _friendTitleLabel.textAlignment = NSTextAlignmentCenter;
        _friendTitleLabel.textColor = DSColorFromHex(0x969696);
    }
    return _friendTitleLabel;
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
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel setText:@"人生就像烟火一样 虽然漂亮却瞬间消失令人伤感，但 是就算瞬间也好，我希望，我希望自己能够绽放，然后默默的 凋谢。" lineSpacing:5];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = DSColorFromHex(0x969696);
        _contentLabel.numberOfLines = 3;
    }
    return _contentLabel;
}

-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
-(UILabel *)line2{
    if (!_line2) {
        _line2 = [[UILabel alloc]init];
        _line2.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line2;
}
-(UILabel *)line3{
    if (!_line3) {
        _line3 = [[UILabel alloc]init];
        _line3.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line3;
}
-(UILabel *)line4{
    if (!_line4) {
        _line4 = [[UILabel alloc]init];
        _line4.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line4;
}
-(UIImageView *)ambryImage{
    if (!_ambryImage) {
        _ambryImage = [[UIImageView alloc]init];
        _ambryImage.image = [UIImage imageNamed:@"store_othe"];
    }
    return _ambryImage;
}
-(UIImageView *)urlImage{
    if (!_urlImage) {
        _urlImage = [[UIImageView alloc]init];
        _urlImage.image = [UIImage imageNamed:@"link_other"];
    }
    return _urlImage;
}
-(UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]init];
        _rightImage.image = [UIImage imageNamed:@"icon_right"];
    }
    return _rightImage;
}
-(UILabel *)ambryLabel{
    if (!_ambryLabel) {
        _ambryLabel = [[UILabel alloc]init];
        _ambryLabel.text = @"商品橱窗";
        _ambryLabel.font = [UIFont systemFontOfSize:13];
        _ambryLabel.textAlignment = NSTextAlignmentLeft;
        _ambryLabel.textColor = DSColorFromHex(0x474747);
    }
    return _ambryLabel;
}
-(UILabel *)urlLabel{
    if (!_urlLabel) {
        _urlLabel = [[UILabel alloc]init];
        _urlLabel.text = @"www.dnaer.com";
        _urlLabel.font = [UIFont systemFontOfSize:13];
        _urlLabel.textAlignment = NSTextAlignmentLeft;
        _urlLabel.textColor = DSColorFromHex(0x18609C);
    }
    return _urlLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bgImage];
        [self addSubview:self.backBtn];
        [self addSubview:self.moreBtn];
        [self addSubview:self.headImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.vImage];
        [self addSubview:self.originalBtn];
        [self addSubview:self.sexBtn];
        [self addSubview:self.constellateBtn];
        [self addSubview:self.cityBtn];
        [self addSubview:self.contentLabel];
        [self addSubview:self.line1];
        [self addSubview:self.line2];
        [self addSubview:self.line3];
        [self addSubview:self.line4];
        [self addSubview:self.fouceNumLabel];
        [self addSubview:self.fouceTitleLabel];
        [self addSubview:self.fansNumLabel];
        [self addSubview:self.fansTitleLabel];
        [self addSubview:self.zanTitleLabel];
        [self addSubview:self.zanNumLabel];
        [self addSubview:self.hateTitleLabel];
        [self addSubview:self.hateNumLabel];
        [self addSubview:self.ambryImage];
        [self addSubview:self.urlImage];
        [self addSubview:self.ambryLabel];
        [self addSubview:self.urlLabel];
        [self addSubview:self.rightImage];
        [self addSubview:self.fouceBtn];
        [self addSubview:self.sendBtn];
        [self addSubview:self.friendNumLabel];
        [self addSubview:self.friendTitleLabel];
        [self addSubview:self.moreSortBtn];
        [self addSubview:self.integralBtn];
        [self.fouceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_bottom).offset(10);
            make.right.equalTo(self).offset(-20);
            
        }];
        [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_bottom).offset(10);
            make.right.equalTo(self.fouceBtn.mas_left).offset(-10);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
        [self.integralBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_bottom).offset(10);
            make.right.equalTo(self.sendBtn.mas_left).offset(-10);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
        
        self.nameLabel.frame = CGRectMake(20, self.headImage.ctBottom+17, 85, 15);
        self.vImage.frame = CGRectMake(self.nameLabel.ctRight+7, self.headImage.ctBottom+17, 14, 14);
        self.detailLabel.frame = CGRectMake(20, self.nameLabel.ctBottom+10, 200, 10);
        self.originalBtn.frame = CGRectMake(20, self.detailLabel.ctBottom+21, 73, 20);
        self.sexBtn.frame = CGRectMake(self.originalBtn.ctRight+6, self.detailLabel.ctBottom+21, 57, 20);
        self.constellateBtn.frame = CGRectMake(self.sexBtn.ctRight+7, self.detailLabel.ctBottom+21, 57, 20);
        self.cityBtn.frame = CGRectMake(self.constellateBtn.ctRight+6, self.detailLabel.ctBottom+21, 72, 20);
        self.contentLabel.frame = CGRectMake(20, self.originalBtn.ctBottom+11, SCREENWIDTH-50, 62);
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(0.5);
        }];
//        self.line2.frame = CGRectMake(20, self.line1.ctBottom+78, SCREENWIDTH-39, 0.5);
//        self.line3.frame = CGRectMake(20, self.line2.ctBottom+40, SCREENWIDTH-39, 0.5);
//        self.line4.frame = CGRectMake(20, self.line3.ctBottom+40, SCREENWIDTH-39, 0.5);
        self.fouceNumLabel.frame = CGRectMake(10, self.contentLabel.ctBottom+40, SCREENWIDTH/6, 15);
        self.fouceTitleLabel.frame = CGRectMake(10, self.fouceNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        self.fansNumLabel.frame = CGRectMake(SCREENWIDTH/6+10, self.contentLabel.ctBottom+40, SCREENWIDTH/6, 15);
        self.fansTitleLabel.frame = CGRectMake(SCREENWIDTH/6+10, self.fansNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        self.zanNumLabel.frame = CGRectMake(SCREENWIDTH/3+10, self.contentLabel.ctBottom+40, SCREENWIDTH/6, 15);
        self.zanTitleLabel.frame = CGRectMake(SCREENWIDTH/3+10, self.zanNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        self.hateNumLabel.frame = CGRectMake(SCREENWIDTH/2+10, self.contentLabel.ctBottom+40, SCREENWIDTH/6, 15);
        self.hateTitleLabel.frame = CGRectMake(SCREENWIDTH/2+10, self.hateNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
        self.friendNumLabel.frame = CGRectMake(SCREENWIDTH*2/3+10, self.contentLabel.ctBottom+40, SCREENWIDTH/6, 15);
        self.friendTitleLabel.frame = CGRectMake(SCREENWIDTH*2/3+10, self.hateNumLabel.ctBottom+10, SCREENWIDTH/6, 15);
         self.moreSortBtn.frame = CGRectMake(SCREENWIDTH*5/6+10, self.contentLabel.ctBottom+50, SCREENWIDTH/6-20, 15);
       
        
    }
    return self;
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
