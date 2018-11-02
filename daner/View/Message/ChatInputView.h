//
//  ChatInputView.h
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseView.h"
#import "UIPlaceHolderTextView.h"


NS_ASSUME_NONNULL_BEGIN

@interface ChatInputView : BaseView
@property(nonatomic,strong)UIButton* voiceBtn;
@property(nonatomic,strong)UIButton* expressionBtn;
@property(nonatomic,strong)UIButton* addBtn;
@property(nonatomic,strong)UIPlaceHolderTextView *textView;
@end

NS_ASSUME_NONNULL_END
