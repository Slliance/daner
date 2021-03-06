//
//  FriendsController.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendsController.h"
#import "KKClassificationView.h"
#import "MineFriendController.h"
#import "AttentionMeController.h"
#import "MyFouceController.h"
#import "MightKnowController.h"
#import "FriendAlertView.h"
@interface FriendsController ()
@property (nonatomic, strong) NSArray *titleArr;
@property(strong, nonatomic) KKClassiflcationLayout *layout;
@property(strong, nonatomic) KKClassificationView *managerView;
@property(copy, nonatomic) NSMutableArray *viewControllers;
@property(nonatomic,strong)UIButton *cameraBtn;
@property(nonatomic,strong)FriendAlertView *alertView;
@end

@implementation FriendsController
-(FriendAlertView *)alertView{
    if (!_alertView) {
        _alertView = [[FriendAlertView alloc]initWithFrame:CGRectMake(SCREENWIDTH-120, [self navHeightWithHeight]+3, 110, 168)];
        _alertView.hidden = YES;
    }
    return _alertView;
}
-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"more_black"] forState:UIControlStateNormal];
        [_cameraBtn addTarget:self action:@selector(pressMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.managerView];
    [self.view addSubview:self.cameraBtn];
    [self.view addSubview:self.alertView];
    
    [self.cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset([self navHeightWithHeight]-46);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(44);
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
-(void)pressMore:(UIButton*)sender{
    sender.selected = !sender.selected;
    self.alertView.hidden = !sender.selected;
    
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
        _layout.isAverage = NO;
        _layout.titleViewBgColor = [UIColor whiteColor];
        _layout.lrMargin = 20;
        //控制滑块高度
        _layout.sliderHeight = 44;
        _layout.titleMargin = 10;
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
        _titleArr = @[@"我的好友",@"关注我的",@"我关注的",@"可能认识"];
    }
    return _titleArr;
}

- (NSMutableArray *)viewControllers
{
    if (!_viewControllers) {
        _viewControllers = [[NSMutableArray alloc]init];
        MineFriendController *friendvc = [[MineFriendController alloc]init];
        [_viewControllers addObject:friendvc];
        AttentionMeController *attentionvc = [[AttentionMeController alloc]init];
        [_viewControllers addObject:attentionvc];
        MyFouceController *foucevc = [[MyFouceController alloc]init];
        [_viewControllers addObject:foucevc];
        MightKnowController *mightvc = [[MightKnowController alloc]init];
        [_viewControllers addObject:mightvc];
        
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
