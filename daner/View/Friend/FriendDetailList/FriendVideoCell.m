//
//  FriendVideoCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendVideoCell.h"

@implementation FriendVideoCell

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
        _BGImage.image = [UIImage imageNamed:@"headimage_found"];
        _BGImage.userInteractionEnabled = YES;
    }
    return _BGImage;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"今天";
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
        _dateLabel.text = @"";
        _dateLabel.font = [UIFont systemFontOfSize:13];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.textColor = DSColorFromHex(0xFEFEFE);
    }
    return _dateLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"人生就像烟火一样";
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x464646);
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel setText:@"人生就像烟火一样 虽然漂亮却瞬间消失令人 伤感，但是就算瞬间也好，我希望自己能够 绽放，然后默默的凋谢。                                                                                                                                                                                                                                                                                                                                                                                                    " lineSpacing:5];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = DSColorFromHex(0x464646);
        _contentLabel.numberOfLines = 3;
    }
    return _contentLabel;
}
-(UIButton *)musicBtn{
    if (!_musicBtn) {
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_musicBtn setImage:[UIImage imageNamed:@"music_found"] forState:UIControlStateNormal];
        [_musicBtn setImage:[UIImage imageNamed:@"music_found"] forState:UIControlStateSelected];
        [_musicBtn addTarget:self action:@selector(pressMusic) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"stop_icon"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"play_icon"] forState:UIControlStateSelected];
        [_playBtn addTarget:self action:@selector(pressPlay:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
-(ZSRunLabelView *)musicLabel{
    if (!_musicLabel) {
        _musicLabel = [[ZSRunLabelView alloc]initWithFrame:CGRectMake(39, SCREENWIDTH-110-31, 100, 15)];
        _musicLabel.text = @"I Found Out Too Late";
        
        _musicLabel.font = [UIFont systemFontOfSize:13];
        _musicLabel.speed = 0.5;
        _musicLabel.textColor = DSColorFromHex(0xFEFEFE);
        
    }
    return _musicLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setContentLayout];
    }
    return self;
}
-(void)setContentLayout{
    [self addSubview:self.nameLabel];
    [self addSubview:self.dateLabel];
    [self addSubview:self.BGImage];
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentLabel];
    [self.BGImage addSubview:self.musicBtn];
    [self.BGImage addSubview:self.musicLabel];
    [self.BGImage addSubview:self.playBtn];
    [self addSubview:self.lineLabel];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(90);
        make.right.equalTo(self).offset(-20);
        make.bottom.equalTo(self.mas_bottom).offset(-0.5);
        make.height.mas_equalTo(0.5);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(20);
    }];
    [self.BGImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(90);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self).offset(20);
        make.width.height.mas_equalTo(SCREENWIDTH-110);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(90);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.BGImage.mas_bottom).offset(10);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(90);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(9);
    }];
    [self.musicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.BGImage).offset(13);
        make.bottom.equalTo(self.BGImage.mas_bottom).offset(-13);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(18);
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.BGImage).offset(-14);
        make.centerY.equalTo(self.musicBtn);
        
    }];
}
-(void)pressPlay:(UIButton *)sender{
    sender.selected = !sender.selected;
}
@end
