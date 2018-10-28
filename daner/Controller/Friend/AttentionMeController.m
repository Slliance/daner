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
        _headView = [[FriendHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
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
    return 3;
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
    [mescell.followBtn setImage:[UIImage imageNamed:@"mutual_firend"] forState:UIControlStateSelected];
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
