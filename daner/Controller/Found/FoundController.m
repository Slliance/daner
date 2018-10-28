//
//  FoundController.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FoundController.h"
#import "FoundNavView.h"
#import "KKClassificationView.h"
#import "BaseFoundController.h"


@interface FoundController ()
@property(nonatomic,strong)FoundNavView *navView;
@property (nonatomic, strong) NSArray *titleArr;
@property(strong, nonatomic) KKClassiflcationLayout *layout;
@property(strong, nonatomic) KKClassificationView *managerView;
@property(copy, nonatomic) NSMutableArray *viewControllers;
@property(nonatomic,strong)UIButton *cameraBtn;
@property(nonatomic,strong)UIButton *searchBtn;
@end

@implementation FoundController
-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"camera_found"] forState:UIControlStateNormal];
    }
    return _cameraBtn;
}
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"search_found"] forState:UIControlStateNormal];
    }
    return _searchBtn;
}
-(FoundNavView *)navView{
    if (!_navView) {
        _navView = [[FoundNavView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [self navHeightWithHeight])];
    }
    return _navView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
     [self.view addSubview:self.managerView];
    [self.view addSubview:self.cameraBtn];
    [self.view addSubview:self.searchBtn];
    [self.cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(13);
        make.top.equalTo(self.view).offset([self navHeightWithHeight]-17-13);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(17);
    }];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-13);
        make.top.equalTo(self.view).offset([self navHeightWithHeight]-18-13);
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(18);
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
        _managerView = [[KKClassificationView alloc]initWithFrame:CGRectMake(0,[self navHeightWithHeight]-44, SCREENWIDTH, SCREENHEIGHT-[self navHeightWithHeight]) viewController:self layout:self.layout clickBlock:^(NSInteger index) {
            
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
        _layout.lrMargin = SCREENWIDTH/2-180/2;
        //控制滑块高度
        _layout.sliderHeight = 44;
        _layout.titleMargin = 0;
        _layout.titleSelectColor = DSColorFromHex(0x464646);
        _layout.titleColor = DSColorFromHex(0x969696);
        _layout.titleFont = [UIFont systemFontOfSize:13];
        _layout.titleSelectFont = [UIFont boldSystemFontOfSize:20];
        _layout.titles = self.titleArr;
        _layout.viewControllers = self.viewControllers;
        _layout.LinkColor = [UIColor whiteColor];
        _layout.linkHeight = 0.5;
        _layout.bottomLineHeight = 2;
        _layout.bottomLineWidth = 30;
        _layout.bottomLineColor = [UIColor whiteColor];
    }
    return _layout;
}

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"关注",@"推荐",@"附近"];
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
