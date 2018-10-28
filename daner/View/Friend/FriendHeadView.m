//
//  FriendHeadView.m
//  daner
//
//  Created by 张舒 on 2018/10/27.
//  Copyright © 2018年 dnaer7. All rights reserved.
//

#import "FriendHeadView.h"

@implementation FriendHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.searchBtn];

        [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"friend_search"] forState:UIControlStateNormal];
        [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchBtn setTitleColor:DSColorFromHex(0xB3B3B3) forState:UIControlStateNormal];
        _searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -SCREENWIDTH+90, 0, 0);
        _searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -SCREENWIDTH+110, 0, 0);
        [_searchBtn.layer setCornerRadius:15];
        [_searchBtn.layer setMasksToBounds:YES];
        _searchBtn.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _searchBtn;
}
@end
