//
//  DNAssetsCollectionViewCell.m
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNAssetsCollectionViewCell.h"
#import "ZSConfig.h"
@implementation DNAssetsCollectionViewCell
-(UIImageView *)bgImage{
    if (!_bgImage) {
        _bgImage = [[UIImageView alloc]init];
        _bgImage.image = [UIImage imageNamed:@"collect_bg1"];
        _bgImage.userInteractionEnabled = YES;
        _bgImage.backgroundColor = COLHEX(@"#F0F0F0");
        [_bgImage.layer setCornerRadius:30];
    }
    return _bgImage;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"book_mine"];
        
    }
    return _headImage;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"导入通讯录";
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = COLHEX(@"#959595");
    }
    return _titleLabel;
}
-(UILabel *)centerLabel{
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc]init];
        _centerLabel.text = @"200积分";
        _centerLabel.font = [UIFont systemFontOfSize:10];
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        _centerLabel.textColor = [UIColor whiteColor];
    }
    return _centerLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImage];
        [self.bgImage addSubview:self.headImage];
        [self addSubview:self.titleLabel];
        [self.bgImage addSubview:self.centerLabel];
        [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(30);
            make.left.equalTo(self).offset(10);
            make.height.mas_equalTo(60);
            make.width.mas_equalTo(60);
        }];
        [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_top).offset(18);
            make.centerX.equalTo(self.bgImage);
        }];
        [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImage.mas_bottom).offset(4);
            make.centerX.equalTo(self.bgImage);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_bottom).offset(10);
            make.left.equalTo(self).offset(10);
            make.height.mas_equalTo(9);
            make.width.mas_equalTo(60);
        }];
    }
    return self;
}
@end
