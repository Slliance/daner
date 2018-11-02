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
#import "PersonalFriendsCell.h"
#import "FriendDetailComCell.h"

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
    [self setRightButtonWithIcon:[UIImage imageNamed:@"more_message"]];
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
    
    
    if (indexPath.row ==4) {
        static NSString *identify = @"PersonalFriendsCell";
        PersonalFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[PersonalFriendsCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *identify = @"FriendDetailComCell";
    FriendDetailComCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FriendDetailComCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
    if (indexPath.row ==0) {
        cell.titleLabel.text = @"分组";
        cell.detailLabel.text = @"同学";
        [cell setImageName:@"icon_right"];
    }else if (indexPath.row ==1){
        cell.titleLabel.text = @"标签";
        cell.detailLabel.text = @"大学室友  ";
        [cell setImageName:@"icon_right"];
    }else if (indexPath.row ==2){
        cell.titleLabel.text = @"电话号码";
        cell.detailLabel.text = @"13645678861";
        cell.detailLabel.textColor = DSColorFromHex(0x4282BD);
        cell.detailLabel.font = [UIFont boldSystemFontOfSize:14];
        [cell setImageName:@""];
       
    }else if (indexPath.row ==3){
        cell.titleLabel.text = @"地区";
        cell.detailLabel.text = @"上海 浦东新区";
        [cell setImageName:@""];
    }else if (indexPath.row ==5){
        cell.titleLabel.text = @"更多";
        cell.detailLabel.text = @"";
        [cell setImageName:@"icon_right"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==4) {
        FriendInformationController *friendVC = [[FriendInformationController alloc]init];
        [self.navigationController pushViewController:friendVC animated:YES];
    }
    
}

@end
