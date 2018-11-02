//
//  FriendMusicCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendMusicCell.h"

@implementation FriendMusicCell

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
-(UIImageView *)BGImage{
    if (!_BGImage) {
        _BGImage = [[UIImageView alloc]init];
        _BGImage.image = [UIImage imageNamed:@"6"];
        _BGImage.userInteractionEnabled = YES;
        [_BGImage.layer setCornerRadius:3];
        [_BGImage.layer setMasksToBounds:YES];
    }
    return _BGImage;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"10";
        _nameLabel.font = [UIFont boldSystemFontOfSize:20];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0x454545);
    }
    return _nameLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.text = @"上传:海的另一边";
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = DSColorFromHex(0x969696);
       
    }
    return _contentLabel;
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
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"全世界陪我失眠";
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x464646);
    }
    return _titleLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.text = @"00:15";
        _countLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.textAlignment = NSTextAlignmentLeft;
        _countLabel.textColor = DSColorFromHex(0x969696);
        
    }
    return _countLabel;
}
-(UIButton *)paiBtn{
    if (!_paiBtn) {
        _paiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_paiBtn setTitle:@"用它拍视频" forState:UIControlStateNormal];
        [_paiBtn setTitleColor:DSColorFromHex(0x658AB3) forState:UIControlStateNormal];
        _paiBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _paiBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.BGImage];
        [self addSubview:self.contentLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.paiBtn];
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
        [self.BGImage mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(self).offset(90);
           make.top.equalTo(self).offset(30);
           make.width.height.mas_equalTo(70);
            
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.BGImage.mas_right).offset(10);
            make.right.equalTo(self).offset(-20);
            make.top.equalTo(self).offset(30);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.BGImage.mas_right).offset(10);
            make.right.equalTo(self).offset(-20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        }];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.BGImage.mas_right).offset(10);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self.BGImage.mas_bottom);
        }];
        [self.paiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self.BGImage.mas_bottom).offset(10);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}
@end
