//
//  DNTaskCenterCell.h
//  daner
//
//  Created by zhangshu on 2018/11/21.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNTaskCenterCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *rightBtn;
@property(nonatomic,strong)UILabel *line1;
@end

NS_ASSUME_NONNULL_END
