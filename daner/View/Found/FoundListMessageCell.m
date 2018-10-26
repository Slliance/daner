//
//  FoundListMessageCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FoundListMessageCell.h"
#import "ZSConfig.h"
@implementation FoundListMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIButton *)reviewerBtn{
    if (!_reviewerBtn) {
        _reviewerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reviewerBtn setImage:[UIImage imageNamed:@"head_icon"] forState:UIControlStateNormal];
        [_reviewerBtn.layer setCornerRadius:20];
        [_reviewerBtn.layer setMasksToBounds:YES];
    }
    return _reviewerBtn;
}
-(UILabel *)reviewerName{
    if (!_reviewerName) {
        _reviewerName = [[UILabel alloc]init];
        _reviewerName.text = @"海的另一边";
        _reviewerName.font = [UIFont boldSystemFontOfSize:16];
        _reviewerName.textAlignment = NSTextAlignmentLeft;
        _reviewerName.textColor = DSColorFromHex(0x464646);
    }
    return _reviewerName;
}
-(UILabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc]init];
        _commentLabel.text = @"我发现了一个很酷的软件，推荐给你试试";
        _commentLabel.font = [UIFont systemFontOfSize:14];
        _commentLabel.textAlignment = NSTextAlignmentLeft;
        _commentLabel.textColor = DSColorFromHex(0x464646);
    }
    return _commentLabel;
}
-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"12:30";
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = DSColorFromHex(0x797979);
    }
    return _dateLabel;
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.reviewerBtn];
        [self addSubview:self.reviewerName];
        [self addSubview:self.commentLabel];
        [self addSubview:self.dateLabel];
        [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(63);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        [self.reviewerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(13);
            make.width.height.mas_equalTo(50);
            make.centerY.equalTo(self);
            
        }];
        [self.reviewerName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
            make.top.equalTo(self).offset(25);
        }];
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
            make.top.equalTo(self.reviewerName.mas_bottom).offset(9);
        }];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-13);
            make.top.equalTo(self).offset(25);
        }];
    }
    return self;
}
@end
