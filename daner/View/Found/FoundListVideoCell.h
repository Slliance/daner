//
//  FoundListVideoCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSRunLabelView.h"
#import "PraiseButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface FoundListVideoCell : UITableViewCell
@property(nonatomic,strong)UIImageView *BGImage;
@property(nonatomic,strong)UIButton *headBtn;
@property(nonatomic,strong)UIButton *moreBtn;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *musicBtn;
@property(nonatomic,strong)ZSRunLabelView *musicLabel;
@property(nonatomic,strong)UIButton *playBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *likeBtn;
@property (nonatomic, strong) PraiseButton *praiseButton;
@property(nonatomic,strong)UIButton *hateBtn;
@property(nonatomic,strong)UIButton *shareBtn;
@property(nonatomic,strong)UIButton *messageBtn;
@property(nonatomic,strong)UILabel *likeLabel;
@property(nonatomic,strong)UILabel *hateLabel;
@property(nonatomic,strong)UILabel *shareLabel;
@property(nonatomic,strong)UILabel *messageLabel;
@property(nonatomic,strong)UIImageView *lineImage;
@property(nonatomic,strong)UILabel *lineLabel;


@property(nonatomic,strong)UIButton *reviewerBtn;
@property(nonatomic,strong)UILabel *reviewerName;
@property(nonatomic,strong)UILabel *commentLabel;

@property(nonatomic,strong)UIButton *zanBtn;
@property(nonatomic,strong)UILabel *zanLabel;

@property(nonatomic,strong)UIButton *fouceBtn;


@property(nonatomic,copy)void(^headBlock)(void);

@end

NS_ASSUME_NONNULL_END
