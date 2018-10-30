//
//  FriendInformationController.m
//  daner
//
//  Created by dnaer7 on 2018/10/30.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendInformationController.h"
#import "FriendInfoHeadView.h"
#import "KKClassificationView.h"
#import "BaseFoundController.h"

@interface FriendInformationController ()<UIScrollViewDelegate>
@property(nonatomic,strong)FriendInfoHeadView *headView;
@property(nonatomic,strong)UIScrollView *bgscrollow;
@property (nonatomic, strong) NSArray *titleArr;
@property(strong, nonatomic) KKClassiflcationLayout *layout;
@property(strong, nonatomic) KKClassificationView *managerView;
@property(copy, nonatomic) NSMutableArray *viewControllers;

@end

@implementation FriendInformationController
-(FriendInfoHeadView *)headView{
    if (!_headView) {
        _headView = [[FriendInfoHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 518)];
    }
    return _headView;
}
-(UIScrollView *)bgscrollow{
    if (!_bgscrollow) {
        _bgscrollow = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44-[self navHeightWithHeight], SCREENWIDTH, SCREENHEIGHT+[self navHeightWithHeight]-44)];
        _bgscrollow.contentSize = CGSizeMake(0, SCREENHEIGHT+518-[self navHeightWithHeight]);
        _bgscrollow.delegate = self;
    }
    return _bgscrollow;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgscrollow];
    [self.bgscrollow addSubview:self.headView];
     [self.bgscrollow addSubview:self.managerView];
    __weak typeof(self)weakself = self;
    [self.headView setBackBlcok:^{
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
#pragma mark - 懒加载
-(KKClassificationView *)managerView
{
    if (!_managerView) {
        _managerView = [[KKClassificationView alloc]initWithFrame:CGRectMake(0,518, SCREENWIDTH, SCREENHEIGHT) viewController:self layout:self.layout clickBlock:^(NSInteger index) {
            
        }];
    }
    return _managerView;
}

-(KKClassiflcationLayout *)layout
{
    if (!_layout) {
        _layout = [[KKClassiflcationLayout alloc] init];
        _layout.isAverage = YES;
        _layout.titleViewBgColor = [UIColor whiteColor];
        _layout.lrMargin = 0;
        //控制滑块高度
        _layout.sliderHeight = 44;
        _layout.titleMargin = 20;
        _layout.titleSelectColor = DSColorFromHex(0x464646);
        _layout.titleColor = DSColorFromHex(0x969696);
        _layout.titleFont = [UIFont systemFontOfSize:13];
        _layout.titleSelectFont = [UIFont boldSystemFontOfSize:16];
        _layout.titles = self.titleArr;
        _layout.viewControllers = self.viewControllers;
        _layout.LinkColor = DSColorFromHex(0xDCDCDC);
        _layout.linkHeight = 0.5;
        _layout.bottomLineHeight = 2;
        _layout.bottomLineWidth = 30;
        _layout.bottomLineColor =[UIColor whiteColor];
    }
    return _layout;
}

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"时光机",@"视频",@"音乐",@"图片",@"语音"];
    }
    return _titleArr;
}

- (NSMutableArray *)viewControllers
{
    if (!_viewControllers) {
        _viewControllers = [[NSMutableArray alloc]init];
        for (NSInteger i = 0 ; i < self.titleArr.count; i ++) {
            BaseFoundController *vc = [[BaseFoundController alloc]init];
            [_viewControllers addObject:vc];
        }
    }
    return _viewControllers;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
