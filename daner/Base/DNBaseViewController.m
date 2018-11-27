//
//  DNBaseViewController.m
//  DnaerApp
//
//  Created by dnaer7 on 2018/11/20.
//  Copyright © 2018 燕来秋. All rights reserved.
//

#import "DNBaseViewController.h"


@interface DNBaseViewController ()
@property (nonatomic, strong) UIControl *controlPopBottom;
@property (nonatomic, strong) UIControl *controlPop;
@property (nonatomic, strong) UIView *suspensionView;//悬浮窗背景
@property (nonatomic, copy) refreshListBlock refreshMsg;
@property (nonatomic, copy) scrollToTopBlcok scrollMsg;
@end

@implementation DNBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        [self adjustNavigationUI:self.navigationController];
        
    }
    return self;
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self adjustNavigationUI:self.navigationController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseUI];
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    //    [center addObserver:self selector:@selector(loginOutSelector) name:LogOutNotificationCenter object:nil];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self adjustNavigationUI:self.navigationController];
    [self setLeftButtonWithIcon:[UIImage imageNamed:@"icon_back"]];

}

- (void)adjustNavigationUI:(UINavigationController *) nav {
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"icon_back"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_back"]];
    NSShadow *shadow = [[NSShadow alloc] init];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           COLHEX(@"#474747"), NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    //去掉返回按钮上的字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    [UIBarButtonItem appearance].tintColor = COLHEX(@"#464646");
    
    NSArray *viewControllerArray = [self.navigationController viewControllers];
    long previousViewControllerIndex = [viewControllerArray indexOfObject:self] - 1;
    UIViewController *previous;
    if (previousViewControllerIndex >= 0&&previousViewControllerIndex<= viewControllerArray.count) {
        previous            = [viewControllerArray objectAtIndex:previousViewControllerIndex];
        previous.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                     initWithTitle:@" "
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:nil];
    }
    
    
    [[UINavigationBar appearance] setShadowImage:[self imageWithColor:COLHEX(@"#F0F0F0") size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5)]];
    
    
    
}
#pragma mark - public methods
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)showToast:(NSString *)info {
    [self showInfo:info];
}
/**
 显示提示
 */
- (void)showInfo:(NSString *)info{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    //    hud.mode = MBProgressHUDModeText;
    //    hud.userInteractionEnabled = NO;
    //    hud.label.text = info;
    //    hud.yOffset = -85;
    //    [hud hide:YES afterDelay:3];
}



- (void)initBaseUI {
    [self setTitle:@""];
}
-(void)setNavWithTitle:(NSString *)navtitle{
    UILabel *navlabel = [[UILabel alloc]init];
    navlabel.textAlignment = NSTextAlignmentCenter;
    navlabel.textColor = COLHEX(@"#474747");
    navlabel.font = [UIFont systemFontOfSize:18];
    navlabel.text = navtitle;
}
- (void)setRightButtonWithTitle:(NSString *) title  {
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(didRightClick)];
    [rightBar setTintColor:[UIColor whiteColor]];
    [rightBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    [rightBar setTitlePositionAdjustment:UIOffsetMake(-10, 0) forBarMetrics:UIBarMetricsDefault];
    [self.navigationItem setRightBarButtonItem:rightBar];
    [self adjustNavigationUI:self.navigationController];
}

- (void)setRightButtonWithIcon:(UIImage *) image {
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(didRightClick)];
    [self.navigationItem setRightBarButtonItem:rightBar];
    [self adjustNavigationUI:self.navigationController];
    
}

- (void)setLeftButtonWithIcon:(UIImage *) image {
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(didLeftClick)];
    [self.navigationItem setLeftBarButtonItem:leftBar];
    [leftBar setTintColor:COLHEX(@"#464646")];
    [self adjustNavigationUI:self.navigationController];
}

- (void)setLeftButtonWithTitle:(NSString *) title  {
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(didLeftClick)];
    [leftBar setTintColor:[UIColor grayColor]];
    [leftBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    [leftBar setTitlePositionAdjustment:UIOffsetMake(10, 0) forBarMetrics:UIBarMetricsDefault];
    [self.navigationItem setLeftBarButtonItem:leftBar];
    [self adjustNavigationUI:self.navigationController];
}

- (void)didRightClick {
    
}

- (void)didLeftClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doLogin {
    //    LoginViewController *controller = [[LoginViewController alloc] init];
    //    [self.navigationController pushViewController:controller animated:YES];
}

- (void)doCheckLogin:(LoginComplited) complited {
    //    if ([[UserCacheBean share] isLogin]) {
    //        if (complited) {
    //            complited();
    //        }
    //        return;
    //    }
    //    LoginViewController *controller = [[LoginViewController alloc] init];
    //    controller.loginComplitedBlock = complited;
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    //    [self presentViewController:nav animated:YES completion:nil];
}




- (void)didClickCancel:(UIControl *)control {
    if (self.controlPop != nil) {
        [self hiddenPopViewWithDoOtherThing];
        [self hidPopView];
    } else {
        [self hiddenBottomView];
    }
}

- (void)hiddenPopViewWithDoOtherThing{
    
}

- (UIView *)suspensionView{
    if (_suspensionView == nil) {
        _suspensionView = [[UIView alloc] init];
        UIButton *refeshButton = [UIButton buttonWithType:UIButtonTypeCustom];
        refeshButton.frame = CGRectMake(0, 0, 36, 36);
        [refeshButton setImage:[UIImage imageNamed:@"icon_suspension_refresh"] forState:UIControlStateNormal];
        [refeshButton addTarget:self action:@selector(refreshList) forControlEvents:UIControlEventTouchUpInside];
        [_suspensionView addSubview:refeshButton];
        
        UIButton *scrollButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [scrollButton setImage:[UIImage imageNamed:@"icon_suspension_toTop"] forState:UIControlStateNormal];
        scrollButton.tag = 100;
        scrollButton.hidden = YES;
        [scrollButton addTarget:self action:@selector(scrollToTop) forControlEvents:UIControlEventTouchUpInside];
        scrollButton.frame = CGRectMake(0, 46, 36, 36);
        [_suspensionView addSubview:scrollButton];
        _suspensionView.hidden = YES;
    }
    return _suspensionView;
}

- (void)refreshList{
    if (self.refreshMsg) {
        self.refreshMsg();
    }
}

- (void)scrollToTop{
    if (self.scrollMsg) {
        self.scrollMsg();
    }
}

- (void)showSuspension:(refreshListBlock)refreshBlock and:(scrollToTopBlcok)scrollToTopBlck{
    [self.view addSubview:self.suspensionView];
    self.suspensionView.hidden = YES;
    float suspensionHeght = -60;
    if (App_Frame_Width > 800) {
        suspensionHeght = -100;
    }
    [self.view bringSubviewToFront:self.suspensionView];
    self.refreshMsg = refreshBlock;
    self.scrollMsg = scrollToTopBlck;
}

- (void)showToTopButtonWith:(CGPoint)contentOffset{
    
    UIButton * toTopBtn = (UIButton *)[self.suspensionView viewWithTag:100];
    if (contentOffset.y > 0) {
        toTopBtn.hidden = NO;
    } else {
        toTopBtn.hidden = YES;
    }
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [transition setType:kCATransitionFade];
    [toTopBtn.layer addAnimation:transition forKey:nil];
}
//退出登录的通知方法
-(void)loginOutSelector{
    NSLog(@">>>>>>>>>>>>>退出成功<<<<<<<<<<<<<");
}



-(CGFloat)navHeightWithHeight{
    NSLog(@"###%f",App_Frame_Height);
    if(App_Frame_Height == 896||App_Frame_Height == 812){
        return  88;
    }else{
        return 64;
    }
}
-(CGFloat)tabBarHeight{
    if(App_Frame_Height == 896||App_Frame_Height == 812){
        return  83;
    }else{
        return 49;
    }
}
-(void)setTextFieldLeftView:(UITextField *)textField :(NSString *)imgStr :(NSInteger)width{
    UIImageView *LeftViewNum = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgStr]];
    //图片的显示模式
    LeftViewNum.contentMode= UIViewContentModeCenter;
    //图片的位置和大小
    LeftViewNum.frame= CGRectMake(10,0,width,30);
    //左视图默认是不显示的 设置为始终显示
    textField.leftViewMode= UITextFieldViewModeAlways;
    textField.leftView= LeftViewNum;
    
}

@end
