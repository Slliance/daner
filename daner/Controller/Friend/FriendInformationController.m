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

#import "LTScrollView-Swift.h"
#import "MJRefresh.h"
#import "BaseInformationController.h"
#import "DNHisBaseInfoController.h"

@interface FriendInformationController ()<LTSimpleScrollViewDelegate>
@property(nonatomic,strong)FriendInfoHeadView *headView;


@property(strong, nonatomic) LTLayout *layout;
@property(strong, nonatomic) LTSimpleManager *managerView;
@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(copy, nonatomic) NSArray <NSString *> *titles;

@end

@implementation FriendInformationController
-(FriendInfoHeadView *)headView{
    if (!_headView) {
        _headView = [[FriendInfoHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 627)];
    }
    return _headView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     self.automaticallyAdjustsScrollViewInsets = NO;
     [self setupSubViews];
    __weak typeof(self)weakself = self;
    [self.headView setBackBlcok:^{
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
    [self.headView setSelectedBlcok:^(NSInteger index) {
        DNHisBaseInfoController *hisVC = [[DNHisBaseInfoController alloc]init];
        [weakself.navigationController pushViewController:hisVC animated:YES];
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

     -(void)setupSubViews {
         
         [self.view addSubview:self.managerView];
         
         __weak typeof(self) weakSelf = self;
         
         //配置headerView
         [self.managerView configHeaderView:^UIView * _Nullable{
             return [weakSelf setupHeaderView];
         }];
         
         //pageView点击事件
         [self.managerView didSelectIndexHandle:^(NSInteger index) {
             NSLog(@"点击了 -> %ld", index);
         }];
         
         //控制器刷新事件
         [self.managerView refreshTableViewHandle:^(UIScrollView * _Nonnull scrollView, NSInteger index) {
             __weak typeof(scrollView) weakScrollView = scrollView;
             scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                 __strong typeof(weakScrollView) strongScrollView = weakScrollView;
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                     NSLog(@"对应控制器的刷新自己玩吧，这里就不做处理了🙂-----%ld", index);
                     [strongScrollView.mj_header endRefreshing];
                 });
             }];
         }];
         
     }
-(FriendInfoHeadView *)setupHeaderView {

         return self.headView;
}
     
-(void)tapGesture:(UITapGestureRecognizer *)gesture {
         NSLog(@"tapGesture");
    
}
     
-(void)glt_scrollViewDidScroll:(UIScrollView *)scrollView {
         NSLog(@"---> %lf", scrollView.contentOffset.y);
}
     
-(LTSimpleManager *)managerView {
         if (!_managerView) {
            _managerView = [[LTSimpleManager alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, SCREENHEIGHT) viewControllers:self.viewControllers titles:self.titles currentViewController:self layout:self.layout];
             
             /* 设置代理 监听滚动 */
             _managerView.delegate = self;
             
             /* 设置悬停位置 */
             //        _managerView.hoverY = 64;
             
             /* 点击切换滚动过程动画 */
             //        _managerView.isClickScrollAnimation = YES;
             
             /* 代码设置滚动到第几个位置 */
             //        [_managerView scrollToIndexWithIndex:self.viewControllers.count - 1];
             
         }
         return _managerView;
}
     
-(LTLayout *)layout {
         if (!_layout) {
             _layout = [[LTLayout alloc] init];
             _layout.bottomLineHeight = 0.0;
             _layout.isHiddenSlider = YES;
             _layout.bottomLineCornerRadius = 2.0;
             _layout.isAverage = false;
             _layout.lrMargin = 20;
             _layout.titleMargin = 50;
             _layout.titleViewBgColor = [UIColor whiteColor];
             _layout.titleColor = DSColorFromHex(0x969696);
             _layout.titleSelectColor = DSColorFromHex(0x454545);
             _layout.titleSelectFont = [UIFont boldSystemFontOfSize:13];
             _layout.titleFont = [UIFont systemFontOfSize:13];
             _layout.scale = 1.25;
             _layout.sliderHeight =50;
             /* 更多属性设置请参考 LTLayout 中 public 属性说明 */
         }
         return _layout;
     }
     
     
- (NSArray <NSString *> *)titles {
         if (!_titles) {
             _titles = @[@"时光机", @"视频", @"音乐", @"图片",@"语音"];
         }
         return _titles;
}
     
     
-(NSArray <UIViewController *> *)viewControllers {
         if (!_viewControllers) {
             _viewControllers = [self setupViewControllers];
         }
         return _viewControllers;
}
     
     
-(NSArray <UIViewController *> *)setupViewControllers {
         NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
         [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             BaseInformationController *testVC = [[BaseInformationController alloc] init];
             [testVCS addObject:testVC];
         }];
         return testVCS.copy;
     }
     
-(void)dealloc {
         NSLog(@"%s",__func__);
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
