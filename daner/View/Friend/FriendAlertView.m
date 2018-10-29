//
//  FriendAlertView.m
//  daner
//
//  Created by dnaer7 on 2018/10/29.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendAlertView.h"

@implementation FriendAlertView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImage];
        [self.bgImage addSubview:self.groupBtn];
        [self.groupBtn addSubview:self.line1];
        [self.bgImage addSubview:self.addBtn];
        [self.addBtn addSubview:self.line2];
        [self.bgImage addSubview:self.qrBtn];
        [self.qrBtn addSubview:self.line3];
        [self.bgImage addSubview:self.shebeiBtn];
        [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self);
        }];
        [self.groupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgImage);
            make.top.equalTo(self.bgImage).offset(7);
            make.height.mas_equalTo(40);
        }];
        [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgImage);
            make.top.equalTo(self.groupBtn.mas_bottom);
            make.height.mas_equalTo(40);
        }];
        [self.qrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgImage);
            make.top.equalTo(self.addBtn.mas_bottom);
            make.height.mas_equalTo(40);
        }];
        [self.shebeiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgImage);
            make.top.equalTo(self.qrBtn.mas_bottom);
            make.height.mas_equalTo(40);
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.groupBtn).offset(10);
            make.right.equalTo(self.groupBtn).offset(-10);
            make.bottom.equalTo(self.groupBtn.mas_bottom);
            make.height.mas_equalTo(0.5);
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addBtn).offset(10);
            make.right.equalTo(self.addBtn).offset(-10);
            make.bottom.equalTo(self.addBtn.mas_bottom);
            make.height.mas_equalTo(0.5);
        }];
        [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.qrBtn).offset(10);
            make.right.equalTo(self.qrBtn).offset(-10);
            make.bottom.equalTo(self.qrBtn.mas_bottom);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

-(UIImageView *)bgImage{
    if (!_bgImage) {
        _bgImage = [[UIImageView alloc]init];
        _bgImage.image = [UIImage imageNamed:@"tan_icon"];
        _bgImage.userInteractionEnabled = YES;
    }
    return _bgImage;
}
-(UIButton *)groupBtn{
    if (!_groupBtn) {
        _groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_groupBtn setImage:[UIImage imageNamed:@"group_chat"] forState:UIControlStateNormal];
        [_groupBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_groupBtn setTitle:@"发起群聊" forState:UIControlStateNormal];
        [_groupBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        _groupBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _groupBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        _groupBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _groupBtn.tag =1;
        
    }
    return _groupBtn;
}
-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setImage:[UIImage imageNamed:@"add_friend"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn setTitle:@"添加朋友" forState:UIControlStateNormal];
        [_addBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        _addBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _addBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        _addBtn.tag =2;
        
    }
    return _addBtn;
}
-(UIButton *)qrBtn{
    if (!_qrBtn) {
        _qrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qrBtn setImage:[UIImage imageNamed:@"qr_friend"] forState:UIControlStateNormal];
        [_qrBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_qrBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_qrBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        _qrBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _qrBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        _qrBtn.titleLabel.font = [UIFont systemFontOfSize:13];
         _qrBtn.tag =3;
        
    }
    return _qrBtn;
}
-(UIButton *)shebeiBtn{
    if (!_shebeiBtn) {
        _shebeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shebeiBtn setImage:[UIImage imageNamed:@"equip_icon"] forState:UIControlStateNormal];
        [_shebeiBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_shebeiBtn setTitle:@"设备管理" forState:UIControlStateNormal];
        [_shebeiBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        _shebeiBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _shebeiBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        _shebeiBtn.titleLabel.font = [UIFont systemFontOfSize:13];
         _shebeiBtn.tag =4;
        
        
    }
    return _shebeiBtn;
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
-(void)pressBtn:(UIButton*)sender{
    sender.selected = !sender.selected;
    
    if (_tmpBtn == nil){
        sender.selected = YES;
        sender.backgroundColor = DSColorFromHex(0xFAFAFA);
        _tmpBtn = sender;
    }else if (_tmpBtn !=nil && _tmpBtn == sender){
        sender.selected = YES;
        sender.backgroundColor = DSColorFromHex(0xFAFAFA);
        
    }else if (_tmpBtn!= sender && _tmpBtn!=nil){
        _tmpBtn.selected = NO;
        _tmpBtn.backgroundColor = [UIColor whiteColor];
        sender.selected = YES;
        sender.backgroundColor = DSColorFromHex(0xFAFAFA);
        _tmpBtn = sender;
    }
    
    
}
@end
