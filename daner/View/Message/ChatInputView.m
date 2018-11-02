//
//  ChatInputView.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ChatInputView.h"

@implementation ChatInputView
-(UIButton *)voiceBtn{
    if (!_voiceBtn) {
        _voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_voiceBtn setImage:[UIImage imageNamed:@"voice_chat"] forState:UIControlStateNormal];
    }
    return _voiceBtn;
}
-(UIButton *)expressionBtn{
    if (!_expressionBtn) {
        _expressionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_expressionBtn setImage:[UIImage imageNamed:@"expression_chat"] forState:UIControlStateNormal];
    }
    return _expressionBtn;
}
-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setImage:[UIImage imageNamed:@"add_chat"] forState:UIControlStateNormal];
    }
    return _addBtn;
}
-(UIPlaceHolderTextView *)textView{
    if (!_textView) {
        _textView = [[UIPlaceHolderTextView alloc]init];
        _textView.placeholder = @"消息内容";
        _textView.placeHolderLabel.font = [UIFont systemFontOfSize:14];
        _textView.placeholderColor = DSColorFromHex(0xB3B3B3);
        _textView.font =  [UIFont systemFontOfSize:14];
        _textView.backgroundColor = DSColorFromHex(0xF0F0F0);
        [_textView.layer setCornerRadius:15];
        [_textView.layer setMasksToBounds:YES];
        _textView.keyboardType =  UIKeyboardTypeDefault;
        _textView.returnKeyType = UIReturnKeySend;
    }
    return _textView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DSColorFromHex(0xFAFAFA);
        [self addSubview:self.textView];
        [self addSubview:self.addBtn];
        [self addSubview:self.voiceBtn];
        [self addSubview:self.expressionBtn];
        self.textView.frame = CGRectMake(50, 10, SCREENWIDTH-140, 30);
        self.voiceBtn.frame = CGRectMake(0, self.textView.ctBottom-30, 50, 30);
        self.expressionBtn.frame = CGRectMake(self.textView.ctRight+10, self.textView.ctBottom-30, 40, 30);
        self.addBtn.frame = CGRectMake(self.textView.ctRight+50, self.textView.ctBottom-30, 40, 30);
        
    }
    return self;
}
@end
