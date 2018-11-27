//
//  DNMineDataassetsView.m
//  daner
//
//  Created by zhangshu on 2018/11/20.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNMineDataassetsView.h"
#import "ZSConfig.h"
static NSString *cellId = @"DNAssetsCollectionViewCell";
@implementation DNMineDataassetsView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];
        [self addSubview:self.titleLabel];
        self.bgArr = [NSMutableArray arrayWithObjects:@"collect_bg1",@"collect_bg2",@"collect_bg3",@"collect_bg1",@"collect_bg2",@"collect_bg3",@"collect_bg1", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"book_mine",@"invite_mine",@"social",@"edit_mine",@"consum_mine",@"fans_mine",@"share_mine", nil];
        self.centerArr = [NSMutableArray arrayWithObjects:@"200积分",@"100积分",@"1币",@"10积分",@"10积分",@"10积分",@"10积分", nil];
        self.titleArr = [NSMutableArray arrayWithObjects:@"导入通讯录",@"邀请好友",@"社交",@"创作",@"消费",@"粉丝",@"分享", nil];
        self.selectedArr = [NSMutableArray arrayWithObjects:@"book_mine_selected",@"invite_mine_selected",@"social_selected",@"edit_mine_selected",@"consum_mine_selected",@"fans_mine_selected",@"share_mine_selected", nil];
    }
    return self;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, App_Frame_Width-40, 15)];
        _titleLabel.text = @"我的数据资产收益";
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x464646);
    }
    return _titleLabel;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 2;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,35, App_Frame_Width, 130) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[DNAssetsCollectionViewCell class] forCellWithReuseIdentifier:cellId];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 0);
    
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(80, 130);
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DNAssetsCollectionViewCell *collectcell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    collectcell.bgImage.image = [UIImage imageNamed:_bgArr[indexPath.row]];
    
   
    collectcell.titleLabel.text = _titleArr[indexPath.row];
    if ([_bgArr[indexPath.row] isEqualToString:@""]) {
         collectcell.centerLabel.textColor = COLHEX(@"#969696");
         collectcell.centerLabel.text = @"暂无收益";
        collectcell.headImage.image = [UIImage imageNamed:_selectedArr[indexPath.row]];
    }else{
         collectcell.centerLabel.textColor = [UIColor whiteColor];
         collectcell.centerLabel.text = _centerArr[indexPath.row];
        collectcell.headImage.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    }
    return collectcell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.bgArr replaceObjectAtIndex:indexPath.row withObject:@""];
    [self.collectionView reloadData];
}

@end
