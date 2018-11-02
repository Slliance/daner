//
//  ChatRecordCell.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ChatRecordCell.h"

@implementation ChatRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
        _musicLabel.text = @" 12''";
        _musicLabel.font = [UIFont systemFontOfSize:10];
        _musicLabel.textAlignment = NSTextAlignmentCenter;
        _musicLabel.textColor = DSColorFromHex(0x969696);
        
    }
    return _musicLabel;
}
-(UIView *)BGView{
    if (!_BGView) {
        _BGView = [[UIView alloc]init];
        _BGView.backgroundColor = DSColorFromHex(0xFAFAFA);
        [_BGView.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_BGView.layer setBorderWidth:0.5];
        [_BGView.layer setCornerRadius:20];
        [_BGView.layer setMasksToBounds:YES];
    }
    return _BGView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"可是要刮台风，不知道到时候能不能出门";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = DSColorFromHex(0x474747);
    }
    return _titleLabel;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"简单";
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0xC8C8C8);
    }
    return _nameLabel;
}

-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"12:33";
        _dateLabel.font = [UIFont systemFontOfSize:10];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = DSColorFromHex(0xC8C8C8);
    }
    return _dateLabel;
}
-(UIButton *)reviewerBtn{
    if (!_reviewerBtn) {
        _reviewerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reviewerBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        [_reviewerBtn.layer setCornerRadius:20];
        [_reviewerBtn.layer setMasksToBounds:YES];
    }
    return _reviewerBtn;
}
-(UIImageView *)BGImage{
    if (!_BGImage) {
        _BGImage = [[UIImageView alloc]init];
        _BGImage.image = [UIImage imageNamed:@"record_found"];
        _BGImage.userInteractionEnabled = YES;
    }
    return _BGImage;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.BGView];
        [self.BGView addSubview:self.reviewerBtn];
        [self.BGView addSubview:self.bgView];
        [self.BGView addSubview:self.titleLabel];
        [self.BGView addSubview:self.nameLabel];
        [self.BGView addSubview:self.dateLabel];
        [self.bgView addSubview:self.playBtn];
        [self.bgView addSubview:self.BGImage];
        [self.bgView addSubview:self.musicLabel];
        self.BGView.frame = CGRectMake(10, 20, SCREENWIDTH-34, 130);
        self.reviewerBtn.frame = CGRectMake(4, 4, 40, 40);
        self.titleLabel.frame = CGRectMake(self.reviewerBtn.ctRight+10, 12, 260 , 14);
        self.bgView.frame = CGRectMake(self.reviewerBtn.ctRight+10, self.titleLabel.ctBottom+10, 266, 60);
        self.playBtn.frame = CGRectMake(0, 0, 56, 60);
        self.BGImage.frame = CGRectMake(56, 17, 160, 26);
        self.musicLabel.frame = CGRectMake(self.BGImage.ctRight, 0, 46, 60);
        self.nameLabel.frame = CGRectMake(56, self.bgView.ctBottom+10, 40, 10);
        self.dateLabel.frame = CGRectMake(self.bgView.ctRight-40, self.bgView.ctBottom+10, 40, 10);
    }
    return self;
}

@end
