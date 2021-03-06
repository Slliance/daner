//
//  FriendDetailHeadView.m
//  daner
//
//  Created by dnaer7 on 2018/10/30.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendDetailHeadView.h"

@implementation FriendDetailHeadView
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"1"];
        [_headImage.layer setCornerRadius:30];
        [_headImage.layer setMasksToBounds:YES];
        
    }
    return _headImage;
}
-(UILabel *)nikeNameLabel{
    if (!_nikeNameLabel) {
        _nikeNameLabel = [[UILabel alloc]init];
        _nikeNameLabel.text = @"昵称：大海";
        _nikeNameLabel.font = [UIFont systemFontOfSize:10];
        _nikeNameLabel.textAlignment = NSTextAlignmentLeft;
        _nikeNameLabel.textColor = DSColorFromHex(0x959595);
    }
    return _nikeNameLabel;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"海的另一边";
        _nameLabel.font = [UIFont boldSystemFontOfSize:14];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0x464646);
    }
    return _nameLabel;
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
        _vImage.image = [UIImage imageNamed:@"collection_fri"];
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
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.nikeNameLabel];
        [self addSubview:self.vImage];
        [self addSubview:self.line1];
        [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            make.width.height.mas_equalTo(60);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage.mas_right).offset(11);
            make.top.equalTo(self).offset(19);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage.mas_right).offset(11);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        }];
        [self.nikeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage.mas_right).offset(11);
            make.top.equalTo(self.detailLabel.mas_bottom).offset(9);
            make.height.mas_equalTo(9);
        }];
       
        [self.vImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.top.equalTo(self).offset(20);
            make.width.mas_equalTo(18);
            make.height.mas_equalTo(17);
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(0);
            make.height.mas_equalTo(0.3);
        }];
        
    }
    return self;
}
@end
