//
//  MyFriendsCell.m
//  daner
//
//  Created by 张舒 on 2018/10/28.
//  Copyright © 2018年 dnaer7. All rights reserved.
//

#import "MyFriendsCell.h"

@implementation MyFriendsCell

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
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        [self addSubview:self.reviewerBtn];
        [self addSubview:self.reviewerName];
       
       
        [self.reviewerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(13);
            make.width.height.mas_equalTo(40);
            make.centerY.equalTo(self);
            
        }];
        [self.reviewerName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
            make.centerY.equalTo(self);
        }];
        
        
    }
    return self;
}
@end
