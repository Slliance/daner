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
@interface BaseFoundController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation BaseFoundController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==1) {
        return 200;
    }else if (indexPath.row ==2||indexPath.row ==3){
        return 90;
    }else if (indexPath.row ==4){
        return 420;
    }else if (indexPath.row ==5){
        return 386;
    }
    return 616;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==1) {
        static NSString *fouce = @"FoundListFouceCell";
        FoundListFouceCell *foucecell = [tableView dequeueReusableCellWithIdentifier:fouce];
        if (!foucecell) {
            foucecell = [[FoundListFouceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fouce];
        }
        foucecell.selectionStyle = UITableViewCellSelectionStyleNone;
        return foucecell;
    }else if (indexPath.row ==2||indexPath.row ==3){
        static NSString *message = @"FoundListMessageCell";
        FoundListMessageCell *mescell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!mescell) {
            mescell = [[FoundListMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
        mescell.selectionStyle = UITableViewCellSelectionStyleNone;
        return mescell;
    }else if (indexPath.row ==4){
        static NSString *message = @"FoundListRecordCell";
        FoundListRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!cell) {
            cell = [[FoundListRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row ==5){
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
    videocell.selectionStyle = UITableViewCellSelectionStyleNone;
    return videocell;
    
}

@end
