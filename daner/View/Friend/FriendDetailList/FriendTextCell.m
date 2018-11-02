//
//  FriendTextCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendTextCell.h"

@implementation FriendTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        [_bgView.layer setMasksToBounds:YES];
        [_bgView.layer setCornerRadius:3];
        [_bgView.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_bgView.layer setBorderWidth:0.5];
    }
    return _bgView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"09";
        _nameLabel.font = [UIFont boldSystemFontOfSize:20];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0x454545);
    }
    return _nameLabel;
}
-(UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"/10月";
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.textColor = DSColorFromHex(0x454545);
    }
    return _dateLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel setText:@"停下手中的繁忙琐事，在焦躁的生活中 享受三分钟的惬意之旅，感受音乐和自 然的美好，相信你会学会更好的生活…                                                                                                                                                                                                                                                                                                                                                                                                    " lineSpacing:3];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = DSColorFromHex(0x464646);
        _contentLabel.numberOfLines = 3;
    }
    return _contentLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.contentLabel];
        [self addSubview:self.lineLabel];
        [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(90);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self.mas_bottom).offset(-0.5);
            make.height.mas_equalTo(0.5);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(30);
        }];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right);
            make.centerY.equalTo(self.nameLabel);
        }];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(90);
            make.right.equalTo(self).offset(-20);
            make.top.equalTo(self).offset(30);
            make.height.mas_equalTo(77);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView).offset(15);
            make.right.equalTo(self.bgView).offset(-15);
            make.top.equalTo(self.bgView).offset(0);
            make.height.mas_equalTo(77);
        }];
    }
    return self;
}
@end
