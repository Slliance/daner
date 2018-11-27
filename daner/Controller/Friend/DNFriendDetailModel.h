//
//  DNFriendDetailModel.h
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNFriendDetailModel : NSObject
///手机号
@property(nonatomic,strong)NSArray *phoneNumList;
///职业
@property(nonatomic,strong)NSArray *professionalList;
///email
@property(nonatomic,strong)NSString *email;
///url
@property(nonatomic,strong)NSString *url;
///公司地址
@property(nonatomic,strong)NSString *address;
///分组
@property(nonatomic,strong)NSString *group;
///标签
@property(nonatomic,strong)NSString *label;
///qq
@property(nonatomic,strong)NSString *qqNum;
///微信
@property(nonatomic,strong)NSString *wechatNum;
///其他备注
@property(nonatomic,strong)NSString *other;


@end

NS_ASSUME_NONNULL_END
