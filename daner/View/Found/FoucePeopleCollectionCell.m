//
//  FoucePeopleCollectionCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FoucePeopleCollectionCell.h"

#import "ZSConfig.h"

@implementation FoucePeopleCollectionCell
-(UIView *)BGView{
    if (!_BGView) {
        _BGView = [[UIView alloc]init];
        _BGView.backgroundColor =  DSColorFromHex(0xFAFAFA);
        [_BGView.layer setCornerRadius:3];
        [_BGView.layer setMasksToBounds:YES];
    }
    return _BGView;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"head_icon"];
        [_headImage.layer setMasksToBounds:YES];
        [_headImage.layer setCornerRadius:35];
    }
    return _headImage;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"海的另一边";
        _nameLabel.font = [UIFont boldSystemFontOfSize:13];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = DSColorFromHex(0x464646);
    }
    return _nameLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"可能感兴趣的人";
        _detailLabel.font = [UIFont boldSystemFontOfSize:12];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = DSColorFromHex(0x777777);
    }
    return _detailLabel;
}
-(UIButton *)fouceBtn{
    if (!_fouceBtn) {
        _fouceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _fouceBtn.backgroundColor = DSColorFromHex(0x464646);
        [_fouceBtn setTitle:@"关注" forState:UIControlStateNormal];
        [_fouceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _fouceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_fouceBtn.layer setCornerRadius:3];
        [_fouceBtn.layer setMasksToBounds:YES];
    }
    return _fouceBtn;
}
-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"fouce_delete"] forState:UIControlStateNormal];
    }
    return _deleteBtn;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.BGView];
        [self.BGView addSubview:self.headImage];
        [self.BGView addSubview:self.nameLabel];
        [self.BGView addSubview:self.detailLabel];
        [self.BGView addSubview:self.fouceBtn];
        [self.BGView addSubview:self.deleteBtn];
        [self setcornerLayout];
    }
    return self;
}
-(void)setcornerLayout{
    [self.BGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(70);
        make.centerX.equalTo(self.BGView);
        make.top.equalTo(self.BGView).offset(20);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.BGView);
        make.top.equalTo(self.headImage.mas_bottom).offset(10);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.BGView);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
    }];
    [self.fouceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(33);
        make.centerX.equalTo(self.BGView);
        make.bottom.equalTo(self.BGView).offset(-5);
    }];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.top.equalTo(self.BGView);
        make.right.equalTo(self.BGView);
    }];
}
@end
