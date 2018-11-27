//
//  MineController.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "MineController.h"
#import "MineHeadView.h"
#import "FriendVideoCell.h"
#import "FriendLocationCell.h"
#import "FriendRecordCell.h"
#import "FriendTextCell.h"
#import "FriendMusicCell.h"
#import "FriendPictureCell.h"
#import "FriendCircleDetailController.h"
#import "DNMineCellHeadView.h"
#import "DNTaskCenterCell.h"
#import "FriendInfoCell.h"
#import "DNMineAboutHeadView.h"

@interface MineController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)MineHeadView *headView;


@end

@implementation MineController

-(MineHeadView *)headView{
    if (!_headView) {
        _headView = [[MineHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 800)];
    }
    return _headView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT-[self tabBarHeight]) style:UITableViewStylePlain];
        _tableview.separatorColor = [UIColor whiteColor];
        self.tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableview];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview.tableHeaderView = self.headView;
    __weak typeof(self)weakself = self;
    [self.headView setBackBlcok:^{
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 3;
    }else if (section ==1){
        return 2;
    }
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==2) {
        if (indexPath.row ==0) {
            return 33+SCREENWIDTH;
        }else if (indexPath.row ==1){
            return 120;
        }else if (indexPath.row ==2){
            return 130;
        }else if (indexPath.row ==3){
            return 130;
        }else if (indexPath.row ==4){
            return 137;
        }else if (indexPath.row ==5){
            return SCREENWIDTH*100/265-11000/265+80;
        }
    }else if (indexPath.section ==1){
        return 51;
    }
    
    return 77;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 51;
    }else if (section ==2){
        return 51;
    }
    return 133;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = COLHEX(@"#F0F0F0");
    if (section ==0) {
        bgView.frame = CGRectMake(0, 0, App_Frame_Width, 51);
        DNMineCellHeadView* sectionView = [[DNMineCellHeadView alloc]init];
        sectionView.frame = CGRectMake(0, 6, App_Frame_Width, 45);
        sectionView.titleLabel.text = @"任务中心";
        [bgView addSubview:sectionView];
    }else if (section ==2){
        bgView.frame = CGRectMake(0, 0, App_Frame_Width, 51);
        DNMineCellHeadView* sectionView = [[DNMineCellHeadView alloc]init];
        sectionView.frame = CGRectMake(0, 6, App_Frame_Width, 45);
        sectionView.titleLabel.text = @"我的时光机";
        [bgView addSubview:sectionView];
    }else{
        bgView.frame = CGRectMake(0, 0, App_Frame_Width, 133);
        DNMineAboutHeadView *aboutView = [[DNMineAboutHeadView alloc]init];
        aboutView.frame = CGRectMake(0, 6, App_Frame_Width, 127);
        [bgView addSubview:aboutView];
    }
    return bgView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        
        static NSString *identify = @"DNTaskCenterCell";
        DNTaskCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[DNTaskCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *titleArr = @[@"完善个人资料",@"邀请好友",@""];
        NSArray *detailArr = @[@"完善全部个人资料获得950积分",@"邀请好友获得200积分",@"查看更多任务"];
        cell.titleLabel.text = titleArr[indexPath.row];
        cell.detailLabel.text = detailArr[indexPath.row];
        if (indexPath.row ==2) {
            cell.detailLabel.font = [UIFont systemFontOfSize:14];
        }
        return cell;
    }else if (indexPath.section ==1){
        static NSString *identify = @"FriendInfoCell";
        FriendInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FriendInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        if (indexPath.row ==1) {
            [cell.ambryImage setImage:[UIImage imageNamed:@"link_other"] forState:UIControlStateNormal];
            cell.ambryLabel.text = @"www.dnaer.com";
            cell.ambryLabel.textColor = COLHEX(@"#18609C");
            cell.rightImage.hidden = YES;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
    }
    if (indexPath.row ==0) {
        static NSString *identify = @"FriendVideoCell";
        FriendVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FriendVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row ==1){
        static NSString *identify = @"FriendRecordCell";
        FriendRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FriendRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row ==2){
        static NSString *identify = @"FriendPictureCell";
        FriendPictureCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FriendPictureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row ==3){
        static NSString *identify = @"FriendMusicCell";
        FriendMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FriendMusicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row ==4){
        static NSString *identify = @"FriendTextCell";
        FriendTextCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FriendTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *identify = @"FriendLocationCell";
    FriendLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FriendLocationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FriendCircleDetailController*circleVc = [[FriendCircleDetailController alloc]init];
    [circleVc setType:indexPath.row];
    circleVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:circleVc animated:YES];
}


@end
