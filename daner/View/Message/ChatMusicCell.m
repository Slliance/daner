//
//  ChatMusicCell.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ChatMusicCell.h"

@implementation ChatMusicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
        _titleLabel.text = @"全世界陪我失眠";
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
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
        _dateLabel.text = @"12:31";
        _dateLabel.font = [UIFont systemFontOfSize:10];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = DSColorFromHex(0xC8C8C8);
    }
    return _dateLabel;
}
-(UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.text = @"海的另一边";
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.textColor = DSColorFromHex(0x474747);
    }
    return _moneyLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"海的另一边";
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.textColor = DSColorFromHex(0x969696);
    }
    return _detailLabel;
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
        _BGImage.image = [UIImage imageNamed:@"11"];
        _BGImage.userInteractionEnabled = YES;
    }
    return _BGImage;
}
-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"stop_video"] forState:UIControlStateNormal];
    }
    return _playBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.BGView];
        [self.BGView addSubview:self.reviewerBtn];
        [self.BGView addSubview:self.titleLabel];
        [self.BGView addSubview:self.nameLabel];
        [self.BGView addSubview:self.dateLabel];
        [self.BGView addSubview:self.BGImage];
        [self.BGView addSubview:self.moneyLabel];
        [self.BGView addSubview:self.detailLabel];
        [self.BGImage addSubview:self.playBtn];
        self.BGView.frame = CGRectMake(10, 20, 248, 114);
        self.reviewerBtn.frame = CGRectMake(4, 4, 40, 40);
        self.BGImage.frame = CGRectMake(55, 11, 70, 70);
        self.titleLabel.frame = CGRectMake(self.BGImage.ctRight+10, 24, 118 , 13);
        self.nameLabel.frame = CGRectMake(56, self.BGImage.ctBottom+10, 40, 10);
        self.dateLabel.frame = CGRectMake(self.BGView.ctRight-40-22, self.BGImage.ctBottom+10, 40, 10);
        self.playBtn.frame = CGRectMake(0, 0, 70, 70);
        self.detailLabel.frame = CGRectMake(self.BGImage.ctRight+10, self.titleLabel.ctBottom+10 , 118 , 13);
        
    }
    return self;
}

@end
