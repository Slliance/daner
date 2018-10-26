//
//  FoundListFouceCell.h
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoucePeopleCollectionCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FoundListFouceCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UILabel *lineLabel;
@end

NS_ASSUME_NONNULL_END
