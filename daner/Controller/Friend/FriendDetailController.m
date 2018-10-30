//
//  FriendDetailController.m
//  daner
//
//  Created by dnaer7 on 2018/10/30.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendDetailController.h"
#import "FriendDetailHeadView.h"
#import "FriendDetailFootView.h"
#import "FriendInformationController.h"

@interface FriendDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)FriendDetailHeadView *headView;
@property(nonatomic,strong)FriendDetailFootView *footView;
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation FriendDetailController
-(FriendDetailHeadView *)headView{
    if (!_headView) {
        _headView = [[FriendDetailHeadView alloc]initWithFrame:CGRectMake(0, [self navHeightWithHeight], SCREENWIDTH, 107)];
    }
    return _headView;
}
-(FriendDetailFootView *)footView{
    if (!_footView) {
        _footView = [[FriendDetailFootView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 250)];
    }
    return _footView;
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.separatorColor = DSColorFromHex(0xF0F0F0);
        self.tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.tableHeaderView = self.headView;
    self.tableview.tableFooterView = self.footView;
    [self.view addSubview:self.tableview];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.view.backgroundColor = DSColorFromHex(0xF0F0F0);
        self.title = @"好友详情";
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==4) {
        return 100;
    }
    return 53;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.textColor = DSColorFromHex(0x464646);
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.textColor = DSColorFromHex(0x979797);
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row ==0) {
        cell.textLabel.text = @"分组";
        cell.detailTextLabel.text = @"同学";
    }else if (indexPath.row ==1){
        cell.textLabel.text = @"标签";
        cell.detailTextLabel.text = @"大学室友";
    }else if (indexPath.row ==2){
        cell.textLabel.text = @"电话号码";
        cell.detailTextLabel.text = @"13645678861";
        cell.detailTextLabel.textColor = DSColorFromHex(0x4282BD);
         cell.accessoryType = UITableViewCellAccessoryNone;
    }else if (indexPath.row ==3){
        cell.textLabel.text = @"地区";
        cell.detailTextLabel.text = @"上海 浦东新区";
    }else if (indexPath.row ==5){
        cell.textLabel.text = @"更多";
        cell.detailTextLabel.text = @"";
    }else if (indexPath.row ==4){
        cell.textLabel.text = @"个人主页";
        cell.detailTextLabel.text = @"";
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendInformationController *friendVC = [[FriendInformationController alloc]init];
    [self.navigationController pushViewController:friendVC animated:YES];
}

@end
