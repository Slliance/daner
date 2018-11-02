//
//  FriendDetailFootView.m
//  daner
//
//  Created by dnaer7 on 2018/10/30.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendDetailFootView.h"

@implementation FriendDetailFootView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DSColorFromHex(0xF0F0F0);
        [self addSubview:self.sendBtn];
        [self addSubview:self.vidieoBtn];
        [self addSubview:self.encrypteBtn];
        [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(40);
        }];
        [self.vidieoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.sendBtn.mas_bottom).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(40);
        }];
        [self.encrypteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.vidieoBtn.mas_bottom).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(40);
        }];
    }
    return self;
}
-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.backgroundColor = DSColorFromHex(0x464646);
        [_sendBtn setTitle:@"发消息" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sendBtn.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_sendBtn.layer setBorderWidth:0.5];
        _sendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sendBtn.layer setCornerRadius:3];
        [_sendBtn.layer setMasksToBounds:YES];
    }
    return _sendBtn;
}
-(UIButton *)vidieoBtn{
    if (!_vidieoBtn) {
        _vidieoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _vidieoBtn.backgroundColor = [UIColor whiteColor];
        [_vidieoBtn setTitle:@"视频聊天" forState:UIControlStateNormal];
        [_vidieoBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        [_vidieoBtn.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_vidieoBtn.layer setBorderWidth:0.5];
        _vidieoBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_vidieoBtn.layer setCornerRadius:3];
        [_vidieoBtn.layer setMasksToBounds:YES];
    }
    return _vidieoBtn;
}
-(UIButton *)encrypteBtn{
    if (!_encrypteBtn) {
        _encrypteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _encrypteBtn.backgroundColor = [UIColor whiteColor];
        [_encrypteBtn setTitle:@"加密聊天" forState:UIControlStateNormal];
        [_encrypteBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateNormal];
        [_encrypteBtn.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_encrypteBtn.layer setBorderWidth:0.5];
        _encrypteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_encrypteBtn.layer setCornerRadius:3];
        [_encrypteBtn.layer setMasksToBounds:YES];
    }
    return _encrypteBtn;
}
@end
