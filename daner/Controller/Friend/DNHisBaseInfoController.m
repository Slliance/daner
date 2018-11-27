//
//  DNHisBaseInfoController.m
//  daner
//
//  Created by zhangshu on 2018/11/21.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "DNHisBaseInfoController.h"
#import "FriendDetailComCell.h"
#import "DNHisBaseInfoHeadView.h"

@interface DNHisBaseInfoController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *detailArr;
@property(nonatomic,strong)DNHisBaseInfoHeadView *headView;

@end

@implementation DNHisBaseInfoController
-(DNHisBaseInfoHeadView *)headView{
    if (!_headView) {
        _headView = [[DNHisBaseInfoHeadView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, 245)];
    }
    return _headView;
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, -[self navHeightWithHeight], App_Frame_Width, App_Frame_Height) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, 50)];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    self.tableview.tableHeaderView = self.headView;
    self.dataArr = [NSMutableArray arrayWithObjects:@"昵称",@"性别",@"生日",@"所在城市",@"个人签名",@"籍贯",@"教育经历",@"工作经历",
                    @"DNA标签",@"绑定微信",@"绑定QQ",@"常用邮箱",nil];
    self.detailArr = [NSMutableArray arrayWithObjects:@"海的另一边",@"女",@"1985年2月1日",@"上海市",@"火",@"南京",@"清华大学",@"源点科技有限公司",
                      @"设计、建筑",@"未绑定",@"已绑定",@"dnaer@163.com",nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"基础信息";
    }
    return self;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 53;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, 0)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 12;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"FriendDetailComCell";
    FriendDetailComCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FriendDetailComCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.titleLabel.text = self.dataArr[indexPath.row];
    cell.detailLabel.text = self.detailArr[indexPath.row];
    [cell setImageName:@""];
    return cell;
}

@end
