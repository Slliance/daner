//
//  AttentionMeController.m
//  daner
//
//  Created by 张舒 on 2018/10/27.
//  Copyright © 2018年 dnaer7. All rights reserved.
//

#import "AttentionMeController.h"
#import "FoundListMessageCell.h"
#import "FriendHeadView.h"

@interface AttentionMeController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)FriendHeadView *headView;
@property(nonatomic,strong)  NSArray *iconArr;
@property(nonatomic,strong)  NSArray *iconTitleArr;
@property(nonatomic,strong)  NSArray *detailArr;
@end

@implementation AttentionMeController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
-(FriendHeadView *)headView{
    if (!_headView) {
        _headView = [[FriendHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 60)];
    }
    return _headView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
     self.tableview.tableHeaderView = self.headView;
    if (@available(iOS 11.0, *)) {
        _tableview.contentInsetAdjustmentBehavior = NO;
       
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.iconArr = @[@"1",@"4",@"5",@"3"];
    self.iconTitleArr = @[@"海的另一边",@"DNAER小助手",@"简单",@"一切随风"];
    self.detailArr = @[@"不悔于过去；不怠于当下…",@"您在DNAER的第一个好朋友",@"连续打了6个喷嚏，我知道…",@"流云向晚弄新晴，雨过柳梢青"];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *message = @"FoundListMessageCell";
    FoundListMessageCell *mescell = [tableView dequeueReusableCellWithIdentifier:message];
    if (!mescell) {
        mescell = [[FoundListMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
    }
    mescell.selectionStyle = UITableViewCellSelectionStyleNone;
    mescell.followBtn.hidden = NO;
    mescell.dateLabel.hidden = YES;
    if (indexPath.row ==0) {
        mescell.followBtn.selected = YES;
    }
    [mescell.reviewerBtn setImage:[UIImage imageNamed:self.iconArr[indexPath.row]] forState:UIControlStateNormal];
    mescell.reviewerName.text = self.iconTitleArr[indexPath.row];
    mescell.commentLabel.text = self.detailArr[indexPath.row];
    [mescell.followBtn setImage:[UIImage imageNamed:@"mutual_firend"] forState:UIControlStateSelected];
    [mescell.followBtn setImage:[UIImage imageNamed:@"mutual_hight"] forState:UIControlStateHighlighted];
    return mescell;
    
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
