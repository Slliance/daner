//
//  DNHisBaseInfoHeadView.m
//  daner
//
//  Created by zhangshu on 2018/11/21.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNHisBaseInfoHeadView.h"
#import "ZSConfig.h"
@implementation DNHisBaseInfoHeadView

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 184, App_Frame_Width, 70)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(App_Frame_Width/2-40, 144, 80, 80)];
        _headImage.image = [UIImage imageNamed:@"1"];
        [_headImage.layer setCornerRadius:40];
        [_headImage.layer setMasksToBounds:YES];
        [_headImage.layer setBorderColor:DSColorFromHex(0xFFFFFF).CGColor];
        [_headImage.layer setBorderWidth:1];
    }
    return _headImage;
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = DSColorFromHex(0xDCDCDC);
    }
    return _line1;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLHEX(@"#FAFAFA");
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.line1];
        [self addSubview:self.headImage];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.bgView);
            make.height.mas_equalTo(0.3);
        }];
    
    }
    return self;
}
@end
