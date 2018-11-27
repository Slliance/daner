//
//  DNTaskCenterCell.m
//  daner
//
//  Created by zhangshu on 2018/11/21.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNTaskCenterCell.h"
#import "ZSConfig.h"
@implementation DNTaskCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.line1];
        [self addSubview:self.rightBtn];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self);
            
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self.mas_bottom).offset(-0.3);
            make.height.mas_equalTo(0.3);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
        
    }
    return self;
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _line1;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, App_Frame_Width-40, 15)];
        _titleLabel.text = @"完善个人资料";
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLHEX(@"#464646");
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"完善全部个人资料获得950积分";
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = COLHEX(@"#959595");
    }
    return _detailLabel;
}
-(UIImageView *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIImageView alloc]init];
        _rightBtn.image = [UIImage imageNamed:@"icon_right"];
    }
    return _rightBtn;
}
@end
