//
//  DNMineDataassetsView.h
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNAssetsCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNMineDataassetsView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)NSMutableArray *bgArr;
@property (nonatomic, strong)NSMutableArray *imageArr;
@property (nonatomic, strong)NSMutableArray *centerArr;
@property (nonatomic, strong)NSMutableArray *titleArr;
@property (nonatomic, strong)NSMutableArray *selectedArr;
@end

NS_ASSUME_NONNULL_END
