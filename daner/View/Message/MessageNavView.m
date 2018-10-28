//
//  MessageNavView.m
//  daner
//
//  Created by 张舒 on 2018/10/27.
//  Copyright © 2018年 dnaer7. All rights reserved.
//

#import "MessageNavView.h"

@implementation MessageNavView

-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"more_message"] forState:UIControlStateNormal];
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
//-(UIButton *)focusBtn{
//    if (!_focusBtn) {
//        _focusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_focusBtn setTitle:@"关注" forState:UIControlStateNormal];
//        [_focusBtn setTitleColor:DSColorFromHex(0x969696) forState:UIControlStateNormal];
//        [_focusBtn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateSelected];
//        _focusBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//        [_focusBtn addTarget:self action:@selector(pressFouceBtn) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _focusBtn;
//}




-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.cameraBtn];
        [self addSubview:self.searchBtn];
        [self setContentLayout];
    }
    return self;
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, SCREENWIDTH, 0.5)];
        _lineLabel.backgroundColor = DSColorFromHex(0xDCDCDC);
    }
    return _lineLabel;
}
-(void)setContentLayout{
    self.searchBtn.frame = CGRectMake(0, self.frame.size.height-44, 44, 44);
    self.cameraBtn.frame = CGRectMake(SCREENWIDTH-44, self.frame.size.height-44, 44, 44);
    NSArray *arr = @[@"消息",@"私信",@"赞我",@"@我",@"评论"];
    for (int i = 0; i<5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:DSColorFromHex(0x969696) forState:UIControlStateNormal];
        [btn setTitleColor:DSColorFromHex(0x464646) forState:UIControlStateSelected];
        btn.frame = CGRectMake(44+i*(SCREENWIDTH/5-88/5), self.frame.size.height-44, SCREENWIDTH/5-88/5, 44);
        btn.tag = i;
        if (i==0) {
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            btn.selected = YES;
            _tmpBtn = btn;
        }else{
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
        }
        
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    [self addSubview:self.lineLabel];
    
   
}


-(void)pressCameraBtn{
    
}
-(void)pressSearchBtn{
    
}
-(void)pressBtn:(UIButton*)sender{
    sender.selected = !sender.selected;
    
    if (_tmpBtn == nil){
        sender.selected = YES;
        sender.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _tmpBtn = sender;
    }else if (_tmpBtn !=nil && _tmpBtn == sender){
        sender.selected = YES;
        sender.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        
    }else if (_tmpBtn!= sender && _tmpBtn!=nil){
        _tmpBtn.selected = NO;
        _tmpBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        sender.selected = YES;
        sender.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _tmpBtn = sender;
    }
    
   
}

@end
