//
//  FoucePeopleCollectionCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoucePeopleCollectionCell : UICollectionViewCell

@property(nonatomic,strong)UIView *BGView;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIButton *fouceBtn;
@property(nonatomic,strong)UIButton *deleteBtn;

@end

NS_ASSUME_NONNULL_END
