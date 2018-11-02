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
        [_reviewerBtn setImage:[UIImage imageNamed:@"head2"] forState:UIControlStateNormal];
        [_reviewerBtn.layer setCornerRadius:25];
        [_reviewerBtn.layer setMasksToBounds:YES];
    }
    return _reviewerBtn;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.backgroundColor = DSColorFromHex(0xFF4141);
        _countLabel.textColor = [UIColor whiteColor];
        _countLabel.font = [UIFont systemFontOfSize:10];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.text = @"12";
        [_countLabel.layer setMasksToBounds:YES];
        [_countLabel.layer setCornerRadius:7.5];
        _countLabel.hidden = YES;
    }
    return _countLabel;
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
        _commentLabel.text = @"不悔于过去；不怠于当下";
        _commentLabel.font = [UIFont systemFontOfSize:14];
        _commentLabel.textAlignment = NSTextAlignmentLeft;
        _commentLabel.textColor = DSColorFromHex(0x969696);
    }
    return _commentLabel;
}
-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"12:30";
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = DSColorFromHex(0x969696);
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
-(UILabel *)lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel1;
}
-(UILabel *)lineLabel2{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel2;
}
-(UILabel *)lineLabel3{
    if (!_lineLabel3) {
        _lineLabel3 = [[UILabel alloc]init];
        _lineLabel3.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel3;
}
-(UIButton *)followBtn{
    if (!_followBtn) {
        _followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_followBtn setImage:[UIImage imageNamed:@"tofollow_mes"] forState:UIControlStateNormal];
         [_followBtn setImage:[UIImage imageNamed:@"follewed_mes"] forState:UIControlStateSelected];
        [_followBtn addTarget:self action:@selector(pressFollow:) forControlEvents:UIControlEventTouchUpInside];
        _followBtn.hidden = YES;
    }
    return _followBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.reviewerBtn];
        [self addSubview:self.reviewerName];
        [self addSubview:self.commentLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.followBtn];
        [self addSubview:self.countLabel];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.lineLabel3];
        [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(63);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        [self.lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        [self.lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(63);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        [self.lineLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        [self.reviewerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(13);
            make.width.height.mas_equalTo(50);
            make.centerY.equalTo(self);
            
        }];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(15);
            make.right.equalTo(self.reviewerBtn.mas_right).offset(1);
            make.top.equalTo(self.reviewerBtn.mas_top).offset(-3);
            
        }];
        [self.reviewerName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
            make.top.equalTo(self).offset(25);
        }];
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
            make.top.equalTo(self.reviewerName.mas_bottom).offset(5);
        }];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-13);
            make.top.equalTo(self).offset(25);
        }];
        [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-13);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(24);
            make.centerY.equalTo(self);
            
        }];
        
    }
    return self;
}
-(void)pressFollow:(UIButton*)sender{
    sender.selected = !sender.selected;
}
@end
