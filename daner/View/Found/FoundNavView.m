//
//  FoundNavView.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FoundNavView.h"
#import "ZSConfig.h"
@implementation FoundNavView

-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"camera_found"] forState:UIControlStateNormal];
    }
    return _cameraBtn;
}
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"search_found"] forState:UIControlStateNormal];
    }
    return _searchBtn;
}
-(UIButton *)focusBtn{
    if (!_focusBtn) {
        _focusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_focusBtn setTitle:@"关注" forState:UIControlStateNormal];
        [_focusBtn setTitleColor:DSColorFromHex(0x969696) forState:UIControlStateNormal];
        [_focusBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateSelected];
        _focusBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_focusBtn addTarget:self action:@selector(pressFouceBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _focusBtn;
}
-(UIButton *)recommendBtn{
    if (!_recommendBtn) {
        _recommendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_recommendBtn setTitle:@"推荐" forState:UIControlStateNormal];
        [_recommendBtn setTitleColor:DSColorFromHex(0x969696) forState:UIControlStateNormal];
        [_recommendBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateSelected];
        _recommendBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _recommendBtn.selected = YES;
        [_recommendBtn addTarget:self action:@selector(pressRecommend) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recommendBtn;
}
-(UIButton *)nearBtn{
    if (!_nearBtn) {
        _nearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nearBtn setTitle:@"附近" forState:UIControlStateNormal];
        [_nearBtn setTitleColor:DSColorFromHex(0x969696) forState:UIControlStateNormal];
        [_nearBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateSelected];
        _nearBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_nearBtn addTarget:self action:@selector(pressNearBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nearBtn;
}




-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.cameraBtn];
        [self addSubview:self.searchBtn];
//        [self addSubview:self.focusBtn];
//        [self addSubview:self.recommendBtn];
//        [self addSubview:self.nearBtn];
//         [self addSubview:self.managerView];
        [self setContentLayout];
    }
    return self;
}
-(void)setContentLayout{
    [self.cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.bottom.equalTo(self).offset(-13);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(17);
    }];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-13);
        make.bottom.equalTo(self).offset(-13);
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(18);
    }];
//    [self.recommendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).offset(-10);
//        make.width.mas_equalTo(60);
//        make.centerX.equalTo(self);
//    }];
//    [self.focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).offset(-10);
//        make.width.mas_equalTo(60);
//        make.right.equalTo(self.recommendBtn.mas_left);
//    }];
//    [self.nearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).offset(-10);
//        make.width.mas_equalTo(60);
//        make.left.equalTo(self.recommendBtn.mas_right);
//    }];
}


-(void)pressCameraBtn{
    
}
-(void)pressSearchBtn{
    
}
-(void)pressFouceBtn{
    self.focusBtn.selected = YES;
    self.focusBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.recommendBtn.selected = NO;
    self.nearBtn.selected = NO;
    self.nearBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.recommendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
}
-(void)pressRecommend{
    self.focusBtn.selected = NO;
    self.recommendBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.recommendBtn.selected = YES;
    self.nearBtn.selected = NO;
    self.nearBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.focusBtn.titleLabel.font = [UIFont systemFontOfSize:13];
}
-(void)pressNearBtn{
    self.focusBtn.selected = NO;
    self.nearBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.recommendBtn.selected = NO;
    self.nearBtn.selected = YES;
    self.focusBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.recommendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
}



@end
