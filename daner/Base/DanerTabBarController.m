//
//  DanerTabBarController.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DanerTabBarController.h"
#import "DanerTabBarItem.h"
#import "MessageController.h"
#import "FriendsController.h"
#import "ReleaseController.h"
#import "FoundController.h"
#import "MineController.h"

@interface DanerTabBarController ()<UITabBarControllerDelegate>

@end

@implementation DanerTabBarController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self configureTabBarController];
    }
    return self;
}
-(void) configureTabBarController
{
    self.tabBarController.tabBar.translucent = NO;//去掉透明
    DanerTabBarItem *messageItem;
    DanerTabBarItem *friendItem;
    DanerTabBarItem *releaseItem;
     DanerTabBarItem *foundItem;
    DanerTabBarItem *mineItem;
    
    
    [[DanerTabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DSColorFromHex(0x464646), NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:16], NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    [[DanerTabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DSColorFromHex(0x969696), NSForegroundColorAttributeName, [UIFont systemFontOfSize:16], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.tabBar.tintColor = DSColorFromHex(0x464646);
    
    messageItem = [[DanerTabBarItem alloc] initWithTitle:@"消息" image:nil selectedImage:nil];
//    messageItem.image = [[UIImage imageNamed:@"next_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    messageItem.selectedImage = [UIImage imageNamed:@"next_icon_selected"];
    
    friendItem = [[DanerTabBarItem alloc]initWithTitle:@"好友" image:nil selectedImage:nil];
    friendItem.image = [[UIImage imageNamed:@"sort_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    friendItem.selectedImage = [UIImage imageNamed:@"sort_icon_selected"];
    friendItem.imageInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    releaseItem = [[DanerTabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"add_tab"] selectedImage:[UIImage imageNamed:@"add_tab"]];
    releaseItem.image = [[UIImage imageNamed:@"add_tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    releaseItem.selectedImage = [UIImage imageNamed:@"add_tab"];
    releaseItem.imageInsets = UIEdgeInsetsMake(0, 0, -20, 0);
    foundItem = [[DanerTabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"shopping_icon_selected"] selectedImage:[UIImage imageNamed:@"shopping_icon_selected"]];
    foundItem.image = [[UIImage imageNamed:@"shopping_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    foundItem.selectedImage = [UIImage imageNamed:@"shopping_icon_selected"];
    mineItem = [[DanerTabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"mine_icon_selected"] selectedImage:[UIImage imageNamed:@"mine_icon_selected"]];
    mineItem.image = [[UIImage imageNamed:@"mine_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineItem.selectedImage = [UIImage imageNamed:@"mine_icon_selected"];
    
    //消息
    MessageController *messageController = [[MessageController alloc]init];
    UINavigationController *messageNavController = [[UINavigationController alloc] initWithRootViewController:messageController];
    messageController.navigationController.navigationBar.translucent = YES;
    messageNavController.tabBarItem = messageItem;
    [self adjustNavigationUI:messageNavController];
    //好友
        FriendsController *friendController = [[FriendsController alloc] init];
        UINavigationController *friendNavController = [[UINavigationController alloc] initWithRootViewController:friendController];
        friendController.navigationController.navigationBar.translucent = YES;
        friendNavController.tabBarItem = friendItem;
        [self adjustNavigationUI:friendNavController];
    
    
    //发布
    ReleaseController *releaseController = [[ReleaseController alloc] init];
    
    UINavigationController *releasNavController = [[UINavigationController alloc] initWithRootViewController:releaseController];
    releaseController.navigationController.navigationBar.translucent = YES;
    releasNavController.tabBarItem = releaseItem;
    [self adjustNavigationUI:releasNavController];
    //发现
    FoundController *foundController = [[FoundController alloc] init];
    
    UINavigationController *foundNavController = [[UINavigationController alloc] initWithRootViewController:foundController];
    foundNavController.tabBarItem = foundItem;
    [self adjustNavigationUI:foundNavController];
    
    //我
    MineController *myController = [[MineController alloc] init];
    UINavigationController *myNavController = [[UINavigationController alloc] initWithRootViewController:myController];
    myController.navigationController.navigationBar.translucent = YES;
    myNavController.tabBarItem = mineItem;
    [self adjustNavigationUI:myNavController];
    
    self.viewControllers = @[messageNavController,friendNavController,releasNavController,foundNavController,myNavController];
    [self.tabBar setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.selectedIndex = 0;
}
- (void)adjustNavigationUI:(UINavigationController *) nav {
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    nav.navigationBar.translucent = YES;
    [[UINavigationBar appearance] setTintColor:DSColorFromHex(0x464646)];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"icon_back"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_back"]];
    NSShadow *shadow = [[NSShadow alloc] init];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           DSColorFromHex(0x474747), NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    //去掉返回按钮上的字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    [UIBarButtonItem appearance].tintColor = [UIColor whiteColor];
    NSArray *viewControllerArray = [self.navigationController viewControllers];
    long previousViewControllerIndex = [viewControllerArray indexOfObject:self] - 1;
    UIViewController *previous;
    if (previousViewControllerIndex >= 0) {
        previous = [viewControllerArray objectAtIndex:previousViewControllerIndex];
        previous.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                     initWithTitle:@""
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:nil];
    }
}
#pragma mark - actions

#pragma mark - tabBarController delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == 0) {
        self.currentIndex = tabBarController.selectedIndex;
    } else if (tabBarController.selectedIndex == 1){
        self.currentIndex = tabBarController.selectedIndex;
    } else if (tabBarController.selectedIndex == 2) {
        self.currentIndex = tabBarController.selectedIndex;
    } else if (tabBarController.selectedIndex == 3) {
        self.currentIndex = tabBarController.selectedIndex;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
