//
//  DNAssetsCollectionViewCell.h
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNAssetsCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *bgImage;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *centerLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
