//
//  FriendCircleDetailController.m
//  daner
//
//  Created by dnaer7 on 2018/11/19.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FriendCircleDetailController.h"
#import "FoundListVideoCell.h"
#import "FoundListFouceCell.h"
#import "FoundListMessageCell.h"
#import "FoundListRecordCell.h"

#import "FoundListPositionCell.h"
#import "FriendInformationController.h"

@interface FriendCircleDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;


@end

@implementation FriendCircleDetailController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
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
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.view.backgroundColor = DSColorFromHex(0xF0F0F0);
        self.title = @"详情";
    }
    return self;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_type  ==1) {
        return 200;
    }else if (_type ==2){
        return 420;
    }else if (_type ==3){
        return 386;
    }
    return 656;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     if (_type ==1){
        static NSString *message = @"FoundListRecordCell";
        FoundListRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!cell) {
            cell = [[FoundListRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (_type ==5){
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

-(void)setType:(NSInteger )type{
    _type = type;
   
    [_tableview reloadData];
}

@end
