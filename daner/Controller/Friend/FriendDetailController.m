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
#import "DNFriendPhoneCell.h"

@interface FriendDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)FriendDetailHeadView *headView;
@property(nonatomic,strong)FriendDetailFootView *footView;
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation FriendDetailController
-(FriendDetailHeadView *)headView{
    if (!_headView) {
        _headView = [[FriendDetailHeadView alloc]initWithFrame:CGRectMake(0, [self navHeightWithHeight], SCREENWIDTH, 101)];
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
        _tableview.separatorColor = [UIColor whiteColor];
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
    return 14;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section ==1){
        return self.resultModel.phoneNumList.count;
    }else if (section ==3){
        return self.resultModel.professionalList.count;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==2) {
        return 100;
    }
    if (indexPath.section ==1&&self.resultModel.phoneNumList.count ==0) {
        return 0;
    }else if(indexPath.section ==3&&self.resultModel.professionalList.count ==0){
        return 0;
    }else if(indexPath.section ==4&&self.resultModel.email.length ==0){
        return 0;
    }else if(indexPath.section ==5&&self.resultModel.url.length ==0){
        return 0;
    }else if(indexPath.section ==6&&self.resultModel.address.length ==0){
        return 0;
    }else if(indexPath.section ==7&&self.resultModel.group.length ==0){
        return 0;
    }else if(indexPath.section ==8&&self.resultModel.label.length ==0){
        return 0;
    }else if(indexPath.section ==9&&self.resultModel.qqNum.length ==0){
        return 0;
    }else if(indexPath.section ==10&&self.resultModel.wechatNum.length ==0){
        return 0;
    }else if(indexPath.section ==11&&self.resultModel.other.length ==0){
        return 0;
    }
    return 53;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section ==2) {
        static NSString *identify = @"PersonalFriendsCell";
        PersonalFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[PersonalFriendsCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section ==0||indexPath.section ==13||indexPath.section ==12){
        static NSString *identify = @"DNFriendPhoneCell";
        DNFriendPhoneCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[DNFriendPhoneCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section ==13) {
            cell.titleLabel.text = @"操作";
            [cell.messageBtn setImage:[UIImage imageNamed:@"share_firend"] forState:UIControlStateNormal];
            cell.phoneBtn.hidden = YES;
            cell.videoBtn.hidden = YES;
            [cell.messageBtn setTitle:@"分享" forState:UIControlStateNormal];
            cell.messageBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
            cell.messageBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        }else if (indexPath.section ==12){
            cell.phoneBtn.hidden = YES;
            cell.videoBtn.hidden = YES;
            [cell.messageBtn setImage:[UIImage imageNamed:@"icon_right"] forState:UIControlStateNormal];
            cell.messageBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        }
        return cell;
    }
    static NSString *identify = @"FriendDetailComCell";
    FriendDetailComCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FriendDetailComCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    if (indexPath.section ==1) {
        if (self.resultModel.phoneNumList.count>0) {
            NSDictionary *dic = self.resultModel.phoneNumList[indexPath.row];
            [cell.detailLabel setTotal:[NSString stringWithFormat:@"%@  %@",dic[@"title"],dic[@"num"]] stringArray:@[dic[@"title"],dic[@"num"]] colorArray:@[COLHEX(@"#979797"),COLHEX(@"#4282BD"),DSColorFromHex(0x464646)] fontArray:@[[UIFont systemFontOfSize:14],[UIFont boldSystemFontOfSize:14]]];
            [cell setImageName:@""];
            if (indexPath.row==0) {
                cell.titleLabel.text = @"电话号码";
                cell.line1.hidden = YES;
            }else if(indexPath.row ==self.resultModel.phoneNumList.count-1){
                cell.titleLabel.text = @"";
                cell.line1.hidden = NO;
            }else{
                cell.titleLabel.text = @"";
                cell.line1.hidden = YES;
            }
        }else{
            cell.hidden = YES;
        }
        
    }else if (indexPath.section ==3){
        if (self.resultModel.professionalList.count>0) {
            cell.detailLabel.text = self.resultModel.professionalList[indexPath.row];
            [cell setImageName:@""];
            if (indexPath.row==0) {
                cell.titleLabel.text = @"职业";
                cell.line1.hidden = YES;
            }else if(indexPath.row ==self.resultModel.phoneNumList.count-1){
                cell.titleLabel.text = @"";
                cell.line1.hidden = NO;
            }else{
                cell.titleLabel.text = @"";
                cell.line1.hidden = YES;
            }
        }else{
            cell.hidden = YES;
        }
        
    }

        if (indexPath.section ==4){
            cell.titleLabel.text = @"EMAIL";
            [cell setImageName:@""];
            cell.detailLabel.textColor = COLHEX(@"#4282BD");
            cell.detailLabel.font = [UIFont boldSystemFontOfSize:14];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.email;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==5){
            cell.titleLabel.text = @"URL";
            [cell setImageName:@""];
            cell.detailLabel.textColor = COLHEX(@"#4282BD");
            cell.detailLabel.font = [UIFont boldSystemFontOfSize:14];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.url;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==6){
            cell.titleLabel.text = @"公司地址";
            [cell setImageName:@""];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.address;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==7){
            cell.titleLabel.text = @"分组";
            [cell setImageName:@""];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.group;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==8){
            cell.titleLabel.text = @"标签";
            [cell setImageName:@""];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.label;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==9){
            cell.titleLabel.text = @"QQ";
            [cell setImageName:@""];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.qqNum;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==10){
            cell.titleLabel.text = @"微信";
            [cell setImageName:@""];
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.wechatNum;
            }else{
                cell.hidden = YES;
            }
        }else if (indexPath.section ==11){
            cell.titleLabel.text = @"其他备注";
            if (self.resultModel.email.length>0) {
                cell.detailLabel.text = self.resultModel.other;
            }else{
                cell.hidden = YES;
            }
            [cell setImageName:@""];
        }

   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==2) {
        FriendInformationController *friendVC = [[FriendInformationController alloc]init];
        [self.navigationController pushViewController:friendVC animated:YES];
    }
    
}

@end
