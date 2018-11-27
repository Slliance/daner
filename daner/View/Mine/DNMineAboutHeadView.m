//
//  DNMineAboutHeadView.m
//  daner
//
//  Created by zhangshu on 2018/11/21.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNMineAboutHeadView.h"
#import "ZSConfig.h"
@implementation DNMineAboutHeadView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.walletBtn];
        [self.bgView addSubview:self.appBtn];
        [self.bgView addSubview:self.likeBtn];
        [self.bgView addSubview:self.collectBtn];
        [self.bgView addSubview:self.infoBtn];
        [self.bgView addSubview:self.line1];
       
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            
        }];
        [self.walletBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
            make.width.mas_equalTo(App_Frame_Width/5);
        }];
        [self.appBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.walletBtn.mas_right);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
            make.width.mas_equalTo(App_Frame_Width/5);
        }];
        [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.appBtn.mas_right);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
            make.width.mas_equalTo(App_Frame_Width/5);
        }];
        [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.likeBtn.mas_right);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
            make.width.mas_equalTo(App_Frame_Width/5);
        }];
        [self.infoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.collectBtn.mas_right);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
            make.width.mas_equalTo(App_Frame_Width/5);
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self.mas_bottom).offset(-0.3);
            make.height.mas_equalTo(0.3);
        }];
       
    }
    return self;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 6, App_Frame_Width, 127)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, App_Frame_Width-40, 15)];
        _titleLabel.text = @"我的相关";
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLHEX(@"#464646");
    }
    return _titleLabel;
}

-(UIButton *)walletBtn{
    if (!_walletBtn) {
        _walletBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _walletBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_walletBtn setTitle:@"钱包" forState:UIControlStateNormal];
        [_walletBtn setTitleColor:COLHEX(@"#979797") forState:UIControlStateNormal];
        [_walletBtn setImage:[UIImage imageNamed:@"wallet_mine"] forState:UIControlStateNormal];
        _walletBtn.imageEdgeInsets = UIEdgeInsetsMake(-2, 20, 0,0);
         _walletBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -49,0);
    }
    return _walletBtn;
}
-(UIButton *)appBtn{
    if (!_appBtn) {
        _appBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _appBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_appBtn setTitle:@"应用" forState:UIControlStateNormal];
        [_appBtn setTitleColor:COLHEX(@"#979797") forState:UIControlStateNormal];
        [_appBtn setImage:[UIImage imageNamed:@"app_mine"] forState:UIControlStateNormal];
        _appBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0,0);
        _appBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -50,0);
    }
    return _appBtn;
}
-(UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _likeBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_likeBtn setTitle:@"喜欢" forState:UIControlStateNormal];
        [_likeBtn setTitleColor:COLHEX(@"#979797") forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"xin_mine"] forState:UIControlStateNormal];
        _likeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0,0);
        _likeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -50,0);
    }
    return _likeBtn;
}
- (UIButton *)collectBtn{
    if (!_collectBtn) {
        _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _collectBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectBtn setTitleColor:COLHEX(@"#979797") forState:UIControlStateNormal];
        [_collectBtn setImage:[UIImage imageNamed:@"collect_mine"] forState:UIControlStateNormal];
        _collectBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0,0);
        _collectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -50,0);
    }
    return _collectBtn;
}
- (UIButton *)infoBtn{
    if (!_infoBtn) {
        _infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _infoBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_infoBtn setTitle:@"资料" forState:UIControlStateNormal];
        [_infoBtn setTitleColor:COLHEX(@"#979797") forState:UIControlStateNormal];
        [_infoBtn setImage:[UIImage imageNamed:@"info_mine"] forState:UIControlStateNormal];
        _infoBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0,0);
        _infoBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -50,0);
    }
    return _infoBtn;
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
@end
