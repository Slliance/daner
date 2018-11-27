//
//  FriendDetailComCell.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendDetailComCell.h"

@implementation FriendDetailComCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIImageView alloc]init];
        
    }
    return _rightBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"分组";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x464646);
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"同学";
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.textColor = DSColorFromHex(0x979797);
    }
    return _detailLabel;
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.rightBtn];
        [self addSubview:self.line1];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-0.3);
            make.height.mas_equalTo(0.3);
        }];
       
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.height.mas_equalTo(53);
            make.centerY.equalTo(self);
            
        }];
        
    }
    return self;
}
-(void)setImageName:(NSString *)imageName{
    _rightBtn.image = [UIImage imageNamed:imageName];
    if (imageName.length>0) {
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self);
            
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.rightBtn.mas_left).offset(-8);
            make.height.mas_equalTo(53);
            make.centerY.equalTo(self);
        }];
       
    }else{
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(53);
            make.centerY.equalTo(self);
        }];
    }
}
@end
