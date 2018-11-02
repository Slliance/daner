//
//  ChatMoneyCell.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ChatMoneyCell.h"

@implementation ChatMoneyCell

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
        _titleLabel.text = @"已收钱";
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x474747);
    }
    return _titleLabel;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"我";
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
        _moneyLabel.text = @"¥100.0";
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.textColor = DSColorFromHex(0x474747);
    }
    return _moneyLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"DNAER转账";
        _detailLabel.font = [UIFont systemFontOfSize:10];
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
        _BGImage.image = [UIImage imageNamed:@"collect_money"];
        _BGImage.userInteractionEnabled = YES;
    }
    return _BGImage;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.BGView];
//        [self.BGView addSubview:self.reviewerBtn];
        [self.BGView addSubview:self.titleLabel];
        [self.BGView addSubview:self.nameLabel];
        [self.BGView addSubview:self.dateLabel];
        [self.BGView addSubview:self.BGImage];
        [self.BGView addSubview:self.moneyLabel];
        [self.BGView addSubview:self.detailLabel];
        self.BGView.frame = CGRectMake(SCREENWIDTH-167, 20, 157, 93);
//        self.reviewerBtn.frame = CGRectMake(4, 4, 40, 40);
        self.BGImage.frame = CGRectMake(20, 10, 50, 50);
        self.titleLabel.frame = CGRectMake(self.BGImage.ctRight+10, 12, 118 , 13);
        self.nameLabel.frame = CGRectMake(20, self.BGImage.ctBottom+10, 40, 10);
        self.dateLabel.frame = CGRectMake(98, self.BGImage.ctBottom+10, 40, 10);
        self.moneyLabel.frame = CGRectMake(self.BGImage.ctRight+10, self.titleLabel.ctBottom+8 , 118 , 13);
        self.detailLabel.frame = CGRectMake(self.BGImage.ctRight+10, self.moneyLabel.ctBottom+5 , 118 , 9);
        
    }
    return self;
}

@end
