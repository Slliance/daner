//
//  DNFriendPhoneCell.m
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNFriendPhoneCell.h"
#import "ZSConfig.h"
@implementation DNFriendPhoneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"网络电话";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x464646);
    }
    return _titleLabel;
}
-(UIButton *)phoneBtn{
    if (!_phoneBtn) {
        _phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_phoneBtn setImage:[UIImage imageNamed:@"phone_friend"] forState:UIControlStateNormal];
    }
    return _phoneBtn;
}
-(UIButton *)videoBtn{
    if (!_videoBtn) {
        _videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_videoBtn setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    }
    return _videoBtn;
}
-(UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@"message_friend"] forState:UIControlStateNormal];
        [_messageBtn setTitleColor:COLHEX(@"#4282BD") forState:UIControlStateNormal];
        _messageBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _messageBtn;
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.line1];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.phoneBtn];
        [self addSubview:self.messageBtn];
        [self addSubview:self.videoBtn];
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-0.3);
            make.height.mas_equalTo(0.3);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.height.mas_equalTo(53);
            make.centerY.equalTo(self);
            
        }];
        [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.width.height.mas_equalTo(53);
        }];
        [self.videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.messageBtn.mas_left);
            make.top.equalTo(self);
            make.width.height.mas_equalTo(53);
        }];
        [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.videoBtn.mas_left);
            make.top.equalTo(self);
            make.width.height.mas_equalTo(53);
        }];
        
    }
    return self;
}
@end
