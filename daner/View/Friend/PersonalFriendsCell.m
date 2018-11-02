//
//  PersonalFriendsCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "PersonalFriendsCell.h"

@implementation PersonalFriendsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"个人主页";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0x464646);
    }
    return _nameLabel;
}
-(UIImageView *)headImage1{
    if (!_headImage1) {
        _headImage1 = [[UIImageView alloc]init];
        _headImage1.image = [UIImage imageNamed:@"6"];
        [_headImage1.layer setCornerRadius:3];
        [_headImage1.layer setMasksToBounds:YES];
       
    }
    return _headImage1;
}
-(UIImageView *)headImage2{
    if (!_headImage2) {
        _headImage2 = [[UIImageView alloc]init];
        _headImage2.image = [UIImage imageNamed:@"7"];
        [_headImage2.layer setCornerRadius:3];
        [_headImage2.layer setMasksToBounds:YES];
        
    }
    return _headImage2;
}
-(UIImageView *)headImage3{
    if (!_headImage3) {
        _headImage3 = [[UIImageView alloc]init];
        _headImage3.image = [UIImage imageNamed:@"8"];
        [_headImage3.layer setCornerRadius:3];
        [_headImage3.layer setMasksToBounds:YES];
        
    }
    return _headImage3;
}
-(UIImageView *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIImageView alloc]init];
        _rightBtn.image = [UIImage imageNamed:@"icon_right"];
    }
    return _rightBtn;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.line1];
        [self addSubview:self.headImage1];
        [self addSubview:self.headImage2];
        [self addSubview:self.headImage3];
        [self addSubview:self.rightBtn];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.height.mas_equalTo(100);
            make.centerY.equalTo(self);
            
        }];
        [self.headImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).offset(10);
            make.width.height.mas_equalTo(80);
            make.centerY.equalTo(self);
            
        }];
        [self.headImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage1.mas_right).offset(3);
            make.width.height.mas_equalTo(80);
            make.centerY.equalTo(self);
            
        }];
        [self.headImage3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage2.mas_right).offset(3);
            make.width.height.mas_equalTo(80);
            make.centerY.equalTo(self);
            
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self);
            
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.bottom.equalTo(self.mas_bottom);
            make.height.mas_equalTo(0.5);
        }];
        
        
    }
    return self;
}
@end
