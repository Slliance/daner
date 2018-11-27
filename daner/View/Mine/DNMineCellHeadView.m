//
//  DNMineCellHeadView.m
//  daner
//
//  Created by zhangshu on 2018/11/21.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNMineCellHeadView.h"
#import "ZSConfig.h"
@implementation DNMineCellHeadView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.moreBtn];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            
        }];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.top.equalTo(self);
            make.width.mas_equalTo(19);
            make.height.mas_equalTo(45);
        }];
    }
    return self;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, App_Frame_Width-40, 15)];
        _titleLabel.text = @"DNAER币分红";
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLHEX(@"#464646");
    }
    return _titleLabel;
}
-(UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setImage:[UIImage imageNamed:@"more_message"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(pressMore) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}
-(void)pressMore{
    
}
@end
