//
//  ScreenFriendCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/29.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ScreenFriendCell.h"

@implementation ScreenFriendCell

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
        [_reviewerBtn setImage:[UIImage imageNamed:@"screen_icon"] forState:UIControlStateNormal];
        
    }
    return _reviewerBtn;
}
-(UILabel *)reviewerName{
    if (!_reviewerName) {
        _reviewerName = [[UILabel alloc]init];
        _reviewerName.text = @"我的好友";
        _reviewerName.font = [UIFont boldSystemFontOfSize:20];
        _reviewerName.textAlignment = NSTextAlignmentLeft;
        _reviewerName.textColor = DSColorFromHex(0x464646);
    }
    return _reviewerName;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.reviewerBtn];
        [self addSubview:self.reviewerName];
        
        
        [self.reviewerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-30);
            make.width.height.mas_equalTo(40);
            make.centerY.equalTo(self);
            
        }];
        [self.reviewerName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.centerY.equalTo(self);
        }];
        
        
    }
    return self;
}
@end
