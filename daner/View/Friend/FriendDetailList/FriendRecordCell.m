//
//  FriendRecordCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendRecordCell.h"

@implementation FriendRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)BGImage{
    if (!_BGImage) {
        _BGImage = [[UIImageView alloc]init];
        _BGImage.image = [UIImage imageNamed:@"record_found"];
        _BGImage.userInteractionEnabled = YES;
    }
    return _BGImage;
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel;
}
-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"stop_gray"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"play_gray"] forState:UIControlStateSelected];
        [_playBtn addTarget:self action:@selector(pressPlay:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
-(UILabel *)musicLabel{
    if (!_musicLabel) {
        _musicLabel = [[UILabel alloc]init];
        _musicLabel.text = @"12''";
        _musicLabel.font = [UIFont systemFontOfSize:10];
        _musicLabel.textAlignment = NSTextAlignmentCenter;
        _musicLabel.textColor = DSColorFromHex(0x969696);
        
    }
    return _musicLabel;
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
        _nameLabel.text = @"19";
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
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.BGImage];
        [self addSubview:self.lineLabel];
        [self.bgView addSubview:self.musicLabel];
        [self.bgView addSubview:self.playBtn];
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
            make.height.mas_equalTo(60);
        }];
        [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView);
            make.width.height.mas_equalTo(60);
            make.centerY.equalTo(self.bgView);
        }];
        [self.BGImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView).offset(60);
            make.centerY.equalTo(self.bgView);
            make.width.mas_equalTo(SCREENWIDTH-210);
           
        }];
        [self.musicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.bgView);
            make.height.mas_equalTo(60);
            make.width.mas_equalTo(40);
            make.centerY.equalTo(self.bgView);
        }];
    }
    return self;
}
-(void)pressPlay:(UIButton *)sender{
    sender.selected = !sender.selected;
}



@end
