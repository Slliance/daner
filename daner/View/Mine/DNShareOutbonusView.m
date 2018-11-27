//
//  DNShareOutbonusView.m
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNShareOutbonusView.h"
#import "ZSConfig.h"
@implementation DNShareOutbonusView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.line1];
        [self addSubview:self.xieLine];
        [self addSubview:self.unitLabel];
        [self addSubview:self.totalLabel];
        [self addSubview:self.totalNum];
        [self addSubview:self.productLabel];
        [self addSubview:self.productNum];
        
        [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.mas_equalTo(45);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.headView.mas_bottom).offset(11);
            
        }];
        [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        }];
        [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.moneyLabel.mas_right);
            make.bottom.equalTo(self.moneyLabel.mas_bottom).offset(-2);
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(0.3);
            make.top.equalTo(self).offset(131);
        }];
        [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.line1.mas_bottom).offset(19);
        }];
        [self.totalNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.totalLabel.mas_bottom).offset(17);
        }];
        [self.xieLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.totalLabel.mas_top);
            make.width.mas_equalTo(28);
            make.centerX.equalTo(self).offset(26);
            make.bottom.equalTo(self.totalNum.mas_bottom);
        }];
        [self.productLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.xieLine.mas_right).offset(-8);
            make.top.equalTo(self.line1.mas_bottom).offset(19);
        }];
        [self.productNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.xieLine.mas_right).offset(-8);
            make.top.equalTo(self.productLabel.mas_bottom).offset(17);
        }];
        
    }
    return self;
}
-(DNMineCellHeadView *)headView{
    if (!_headView) {
        _headView = [[DNMineCellHeadView alloc]init];
    }
    return _headView;
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
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"今日分红(下次分红时间：2019年5月28日)";
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLHEX(@"#969696");
    }
    return _titleLabel;
}
-(UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.text = @"￥1.35";
        _moneyLabel.font = [UIFont boldSystemFontOfSize:16];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.textColor = COLHEX(@"#464646");
    }
    return _moneyLabel;
}
-(UILabel *)unitLabel{
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc]init];
        _unitLabel.text = @"/枚DNAER币";
        _unitLabel.font = [UIFont systemFontOfSize:12];
        _unitLabel.textAlignment = NSTextAlignmentLeft;
        _unitLabel.textColor = COLHEX(@"#464646");
    }
    return _unitLabel;
}
-(UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.text = @"DNAER币总量(枚)";
        _totalLabel.font = [UIFont systemFontOfSize:12];
        _totalLabel.textAlignment = NSTextAlignmentLeft;
        _totalLabel.textColor = COLHEX(@"#969696");
    }
    return _totalLabel;
}
-(UILabel *)totalNum{
    if (!_totalNum) {
        _totalNum = [[UILabel alloc]init];
        _totalNum.text = @"10,000,000,000枚";
        _totalNum.font = [UIFont boldSystemFontOfSize:16];
        _totalNum.textAlignment = NSTextAlignmentLeft;
        _totalNum.textColor = COLHEX(@"#464646");
    }
    return _totalNum;
}

-(UILabel *)productLabel{
    if (!_productLabel) {
        _productLabel = [[UILabel alloc]init];
        _productLabel.text = @"已产生DNAER币数量(枚)";
        _productLabel.font = [UIFont systemFontOfSize:12];
        _productLabel.textAlignment = NSTextAlignmentLeft;
        _productLabel.textColor = COLHEX(@"#969696");
    }
    return _productLabel;
}
-(UILabel *)productNum{
    if (!_productNum) {
        _productNum = [[UILabel alloc]init];
        _productNum.text = @"12,455,325枚";
        _productNum.font = [UIFont boldSystemFontOfSize:16];
        _productNum.textAlignment = NSTextAlignmentLeft;
        _productNum.textColor = COLHEX(@"#464646");
    }
    return _productNum;
}
-(UILabel *)xieLine{
    if (!_xieLine) {
        _xieLine = [[UILabel alloc]init];
                CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] initWithLayer:_xieLine.layer];
                shapeLayer.lineWidth = 1.0;
        
                shapeLayer.strokeColor = COLHEX(@"#C9C9C9").CGColor;
        
                shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
                UIBezierPath *path = [[UIBezierPath alloc] init];
        
                [path moveToPoint:CGPointMake(-20, 46)];//斜线的起点
        
                [path addLineToPoint:CGPointMake(0, 0)];//斜线的终点
        
                shapeLayer.path = path.CGPath;
        
                [_xieLine.layer addSublayer:shapeLayer];
    
    }
   return  _xieLine;
}



@end
