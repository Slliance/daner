//
//  MessageController.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "MessageController.h"
#import "FoundListMessageCell.h"
#import "MessageNavView.h"
#import "ChatDetailsController.h"



@interface MessageController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)MessageNavView *navView;
@property (strong, nonatomic) NSIndexPath* editingIndexPath;
@property(nonatomic,strong)NSArray *iconArr;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *detailArr;
@end

@implementation MessageController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [self navHeightWithHeight], SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
-(MessageNavView *)navView{
    if (!_navView) {
        _navView = [[MessageNavView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [self navHeightWithHeight])];
    }
    return _navView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.tableview];
    self.iconArr = @[@"1",@"2",@"3"];
    self.titleArr = @[@"海的另一边",@"DNAER小助手",@"简单"];
    self.detailArr = @[@"我发现了一个很酷的软件，推荐给你试试",@"又发现了一些您可能认识的朋友",@"[文件]DNAER 原型图"];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.iconArr.count;
}
- (NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //title不设为nil 而是空字符串 理由为啥 ？   自己实践 跑到ios11以下的机器上就知道为啥了
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
       
        [tableView setEditing:NO animated:YES];  // 这句很重要，退出编辑模式，隐藏左滑菜单
    }];
    UITableViewRowAction *topAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        
        [tableView setEditing:NO animated:YES];  // 这句很重要，退出编辑模式，隐藏左滑菜单
    }];
    return @[deleteAction,topAction];
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editingIndexPath = indexPath;
    [self.view setNeedsLayout];   // 触发-(void)viewDidLayoutSubviews
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editingIndexPath = nil;
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    if (self.editingIndexPath)
    {
        [self configSwipeButtons];
        [self configSwipeButtons];
    }
}

- (void)configSwipeButtons
{
    // 获取选项按钮的reference
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0"))
    {
        // iOS 11层级 (Xcode 9编译): UITableView -> UISwipeActionPullView
        for (UIView *subview in self.tableview.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] && [subview.subviews count] >= 2)
            {
                // 和iOS 10的按钮顺序相反
                UIButton *deleteButton = subview.subviews[1];
                UIButton *readButton = subview.subviews[0];
                
                [self configDeleteButton:deleteButton];
                [self configReadButton:readButton];
            }
        }
    }
    else
    {
        // iOS 8-10层级: UITableView -> UITableViewCell -> UITableViewCellDeleteConfirmationView
        FoundListMessageCell *tableCell = [self.tableview cellForRowAtIndexPath:self.editingIndexPath];
        for (UIView *subview in tableCell.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] && [subview.subviews count] >= 2)
            {
                UIButton *deleteButton = subview.subviews[0];
                UIButton *readButton = subview.subviews[1];
                
                [self configDeleteButton:deleteButton];
                [self configReadButton:readButton];
                [subview setBackgroundColor:DSColorFromHex(0xF0F0F0)];
            }
        }
    }
    

}

- (void)configDeleteButton:(UIButton*)deleteButton
{
    if (deleteButton)
    {
        
        deleteButton.titleLabel.font = [UIFont systemFontOfSize:12];
        deleteButton.titleLabel.textColor = DSColorFromHex(0X787878);
        deleteButton.titleLabel.text = @"删除";
        [deleteButton setTitleColor:DSColorFromHex(0X787878) forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage imageNamed:@"delete_message"] forState:UIControlStateNormal];
        [deleteButton setBackgroundColor:DSColorFromHex(0xF0F0F0)];
        // 调整按钮上图片和文字的相对位置（该方法的实现在下面）
        [self centerImageAndTextOnButton:deleteButton];
    }
}

- (void)configReadButton:(UIButton*)readButton
{
    if (readButton)
    {
        readButton.titleLabel.font = [UIFont systemFontOfSize:12];
        readButton.titleLabel.textColor = DSColorFromHex(0X787878);
        readButton.titleLabel.text = @"置顶";
        [readButton setTitleColor:DSColorFromHex(0X787878) forState:UIControlStateNormal];
        // 根据当前状态选择不同图片
        BOOL isRead = NO;
        UIImage *readButtonImage = [UIImage imageNamed:@"top_message"];
        [readButton setImage:readButtonImage forState:UIControlStateNormal];
        
        [readButton setBackgroundColor:DSColorFromHex(0xF0F0F0)];
        // 调整按钮上图片和文字的相对位置（该方法的实现在下面）
        [self centerImageAndTextOnButton:readButton];
    }
}
- (void)centerImageAndTextOnButton:(UIButton*)button
{
    // this is to center the image and text on button.
    // the space between the image and text
    CGFloat spacing = 35.0;
    
    // lower the text and push it left so it appears centered below the image
    CGSize imageSize = button.imageView.image.size;
    button.titleEdgeInsets = UIEdgeInsetsMake(40, 10, 0, 0);
    
    // raise the image and push it right so it appears centered above the text
    CGSize titleSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: button.titleLabel.font}];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0.0, -30,0);
    
    // increase the content height to avoid clipping
    CGFloat edgeOffset = (titleSize.height - imageSize.height) / 2.0;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0.0, 10, 0.0);
    
    // move whole button down, apple placed the button too high in iOS 10
    if (SYSTEM_VERSION_LESS_THAN(@"11.0"))
    {
        CGRect btnFrame = button.frame;
        btnFrame.origin.y = -10;
        button.frame = btnFrame;
    }

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
        static NSString *message = @"FoundListMessageCell";
        FoundListMessageCell *mescell = [tableView dequeueReusableCellWithIdentifier:message];
        if (!mescell) {
            mescell = [[FoundListMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:message];
        }
    if (indexPath.row ==2) {
        mescell.countLabel.hidden = NO;
    }else{
        mescell.countLabel.hidden = YES;
    }
    mescell.lineLabel.hidden = NO;
    mescell.lineLabel3.hidden = YES;
    mescell.lineLabel1.hidden = YES;
    mescell.lineLabel2.hidden = YES;
    [mescell.reviewerBtn setImage:[UIImage imageNamed:self.iconArr[indexPath.row]] forState:UIControlStateNormal];
    mescell.reviewerName = self.titleArr[indexPath.row];
    mescell.commentLabel.text = self.detailArr[indexPath.row];
        mescell.selectionStyle = UITableViewCellSelectionStyleNone;
        return mescell;
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatDetailsController *chatVC = [[ChatDetailsController alloc]init];
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
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
