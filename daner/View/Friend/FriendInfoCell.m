//
//  FriendInfoCell.m
//  daner
//
//  Created by dnaer7 on 2018/11/19.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendInfoCell.h"

@implementation FriendInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIButton *)ambryImage{
    if (!_ambryImage) {
        _ambryImage = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ambryImage setImage:[UIImage imageNamed:@"store_othe"] forState:UIControlStateNormal];
    }
    return _ambryImage;
}
-(UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]init];
        _rightImage.image = [UIImage imageNamed:@"icon_right"];
    }
    return _rightImage;
}
-(UILabel *)ambryLabel{
    if (!_ambryLabel) {
        _ambryLabel = [[UILabel alloc]init];
        _ambryLabel.text = @"商品橱窗";
        _ambryLabel.font = [UIFont systemFontOfSize:13];
        _ambryLabel.textAlignment = NSTextAlignmentLeft;
        _ambryLabel.textColor = DSColorFromHex(0x474747);
    }
    return _ambryLabel;
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
        [self addSubview:self.ambryImage];
        [self addSubview:self.ambryLabel];
        [self addSubview:self.rightImage];
        [self addSubview:self.line1];
        self.ambryImage.frame = CGRectMake(21, 0, 12, 52);
        self.ambryLabel.frame = CGRectMake(self.ambryImage.ctRight+10, 0, SCREENWIDTH-60, 52);
        self.rightImage.frame = CGRectMake(SCREENWIDTH-30, 20.5, 6,11);
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.bottom.equalTo(self.mas_bottom).offset(-0.5);
            make.height.mas_equalTo(0.5);
            make.right.equalTo(self).offset(-19);
        }];
    }
    return self;
}
@end
