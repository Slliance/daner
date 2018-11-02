//
//  BaseFoundController.m
//  daner
//
//  Created by dnaer7 on 2018/10/26.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "BaseFoundController.h"
#import "FoundListVideoCell.h"
#import "FoundListFouceCell.h"
#import "FoundListMessageCell.h"
#import "FoundListRecordCell.h"

#import "FoundListPositionCell.h"
#import "FriendInformationController.h"

@interface BaseFoundController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation BaseFoundController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-[self navHeightWithHeight]) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        return 200;
    }else if (indexPath.section ==2){
        return 90;
    }else if (indexPath.section ==3){
        return 420;
    }else if (indexPath.section ==4){
        return 386;
    }
    return 656;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 9;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 30)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==2) {
        return 2;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==1) {
        static NSString *fouce = @"FoundListFouceCell";
        FoundListFouceCell *foucecell = [tableView dequeueReusableCellWithIdentifier:fouce];
        if (!foucecell) {
            foucecell = [[FoundListFouceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fouce];
        }
        foucecell.selectionStyle = UITableViewCellSelectionStyleNone;
        return foucecell;
    }else if (indexPath.section ==2){
        static NSString *message = @"FoundListMessageCell";
        FoundListMessageCell *mescell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!mescell) {
            mescell = [[FoundListMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
        if (indexPath.row ==0) {
            mescell.lineLabel.hidden = NO;
            mescell.lineLabel3.hidden = NO;
            mescell.lineLabel1.hidden = YES;
            mescell.lineLabel2.hidden = YES;
        }else{
            mescell.lineLabel.hidden = YES;
            mescell.lineLabel3.hidden = YES;
            mescell.lineLabel1.hidden = YES;
            mescell.lineLabel2.hidden = NO;
        }
        mescell.selectionStyle = UITableViewCellSelectionStyleNone;
        return mescell;
    }else if (indexPath.section ==3){
        static NSString *message = @"FoundListRecordCell";
        FoundListRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!cell) {
            cell = [[FoundListRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section ==4){
        static NSString *message = @"FoundListPositionCell";
        FoundListPositionCell *cell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!cell) {
            cell = [[FoundListPositionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *video = @"FoundListVideoCell";
    FoundListVideoCell *videocell = [tableView dequeueReusableCellWithIdentifier:video];
    if (!videocell) {
        videocell = [[FoundListVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:video];
    }
    [videocell setHeadBlock:^{
        FriendInformationController *friend = [[FriendInformationController alloc]init];
        friend.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:friend animated:YES];
    }];
    videocell.selectionStyle = UITableViewCellSelectionStyleNone;
    return videocell;
    
}

@end
