//
//  FoundListMessageCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoundListMessageCell : UITableViewCell
@property(nonatomic,strong)UIButton *reviewerBtn;
@property(nonatomic,strong)UILabel *reviewerName;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *followBtn;
@property(nonatomic,strong)UILabel *countLabel;

@end

NS_ASSUME_NONNULL_END
