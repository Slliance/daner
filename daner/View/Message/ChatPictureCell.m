//
//  ChatPictureCell.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ChatPictureCell.h"

@implementation ChatPictureCell

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
        _BGImage.image = [UIImage imageNamed:@"9"];
        _BGImage.userInteractionEnabled = YES;
        [_BGImage.layer setCornerRadius:20];
        [_BGImage.layer setMasksToBounds:YES];
    }
    return _BGImage;
}
-(UILabel *)locLabel{
    if (!_locLabel) {
        _locLabel = [[UILabel alloc]init];
        _locLabel.text = @"12M";
        _locLabel.font = [UIFont systemFontOfSize:10];
        _locLabel.textAlignment = NSTextAlignmentRight;
        _locLabel.textColor = DSColorFromHex(0xFFFFFF);
    }
    return _locLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.BGView];
        [self.BGView addSubview:self.reviewerBtn];
        
        [self.BGView addSubview:self.nameLabel];
        [self.BGView addSubview:self.dateLabel];
        [self.BGView addSubview:self.BGImage];
        [self.BGImage addSubview:self.locLabel];
        self.BGView.frame = CGRectMake(SCREENWIDTH-244, 20, 234, 162);
        
        self.BGImage.frame = CGRectMake(10, 10, 214, 119);
        self.nameLabel.frame = CGRectMake(56, self.BGImage.ctBottom+10, 40, 10);
        self.dateLabel.frame = CGRectMake(self.BGImage.ctRight-50, self.BGImage.ctBottom+10, 40, 10);
        self.locLabel.frame = CGRectMake(self.BGImage.ctRight-70, self.BGImage.ctBottom-30, 40, 7);
        
    }
    return self;
}
@end
