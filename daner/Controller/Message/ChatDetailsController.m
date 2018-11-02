//
//  ChatDetailsController.m
//  daner
//
//  Created by dnaer7 on 2018/11/1.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "ChatDetailsController.h"
#import "ChatTextCell.h"
#import "ChatRecordCell.h"
#import "ChatVideoCell.h"
#import "ChatMusicCell.h"
#import "ChatPictureCell.h"
#import "ChatLocationCell.h"
#import "ChatMoneyCell.h"
#import "ChatFileCell.h"
#import "ChatInputView.h"
#import "InputToolbar.h"
#import "UIView+Extension.h"
@interface ChatDetailsController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,MoreButtonViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)InputToolbar *inputToolbar;
@property (nonatomic,assign)CGFloat inputToolbarY;


@end

@implementation ChatDetailsController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [self navHeightWithHeight], SCREENWIDTH, SCREENHEIGHT-[self navHeightWithHeight]-[self tabBarHeight]) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
        _tableview.allowsSelection = NO;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.inputView];
    self.inputToolbar = [InputToolbar shareInstance];
    [self.view addSubview:self.inputToolbar];
    self.inputToolbar.textViewMaxVisibleLine = 4;
    self.inputToolbar.width = self.view.width;
    self.inputToolbar.height = 49;
    self.inputToolbar.y = SCREENHEIGHT - [self navHeightWithHeight];
    [self.inputToolbar setMorebuttonViewDelegate:self];
    
    __weak typeof(self) weakSelf = self;
    self.inputToolbar.sendContent = ^(NSObject *content){
        NSLog(@"上传服务器内容☀️:---%@",(NSString *)content);
//        weakSelf.textView.text = (NSString *)content;
    };
    
    self.inputToolbar.inputToolbarFrameChange = ^(CGFloat height,CGFloat orignY){
        weakSelf.inputToolbarY = orignY;
        if (weakSelf.tableview.contentSize.height > orignY) {
//            [weakSelf.tableview mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.bottom.mas_equalTo(0);
//            }];
            [weakSelf.tableview setContentOffset:CGPointMake(0, weakSelf.tableview.contentSize.height - orignY) animated:YES];
        }
    };
    
         [self.inputToolbar resetInputToolbar];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTap)];
    [self.tableview addGestureRecognizer:tap];
    
}
-(void)pressTap{
    [self.view endEditing:YES];
}
- (void)dealloc {
    NSLog(@"dealloc");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.inputToolbar.isBecomeFirstResponder = NO;
}

- (void)moreButtonView:(MoreButtonView *)moreButtonView didClickButton:(MoreButtonViewButtonType)buttonType
{
    switch (buttonType) {
        case MoreButtonViewButtonTypeImages:
        {
            UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
            ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            ipc.delegate = self;
            [self presentViewController:ipc animated:YES completion:nil];
        } break;
            
        case MoreButtonViewButtonTypeCamera:
        {
            UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
            ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
            ipc.delegate = self;
            [self presentViewController:ipc animated:YES completion:nil];
        } break;
            
        default:
            break;
    }
}

- (void)inputToolbar:(InputToolbar *)inputToolbar orignY:(CGFloat)orignY
{
    _inputToolbarY = orignY;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //UIImage *image = info[UIImagePickerControllerOriginalImage];
    //图片选取成功
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      [self setRightButtonWithIcon:[UIImage imageNamed:@"more_message"]];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.view.backgroundColor = DSColorFromHex(0xFAFAFA);
        self.title = @"简单";
      
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 77;
    }else if (indexPath.row ==1){
        return 150;
    }else if (indexPath.row ==4){
        return 134;
    }else if (indexPath.row ==2){
        return 182;
    }else if (indexPath.row ==3){
        return 202;
    }else if (indexPath.row ==5){
        return 198;
    }
    return 113;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        static NSString *identify = @"ChatTextCell";
        ChatTextCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        
        
        return cell;
    }else if (indexPath.row ==1) {
        static NSString *identify = @"ChatRecordCell";
        ChatRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    
    }else if (indexPath.row ==2) {
        static NSString *identify = @"ChatPictureCell";
        ChatPictureCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatPictureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }else if (indexPath.row ==3) {
        static NSString *identify = @"ChatVideoCell";
        ChatVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }else if (indexPath.row ==4) {
        static NSString *identify = @"ChatMusicCell";
        ChatMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatMusicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }else if (indexPath.row ==5) {
        static NSString *identify = @"ChatLocationCell";
        ChatLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatLocationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }else if (indexPath.row ==9) {
        static NSString *identify = @"ChatMoneyCell";
        ChatMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ChatMoneyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }
    
    
    static NSString *identify = @"ChatFileCell";
    ChatFileCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[ChatFileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (indexPath.row ==6) {
        
        cell.BGImage.image = [UIImage imageNamed:@"D_chat"];
    }else if (indexPath.row ==7){
        
        cell.BGImage.image = [UIImage imageNamed:@"red_chat"];
        cell.titleLabel.text = @"送给你一个红包";
        cell.moneyLabel.text = @"查看红包";
        cell.detailLabel.text = @"DNAER红包";
    }else if (indexPath.row ==8){
         cell.BGImage.image = [UIImage imageNamed:@"transfer_chat"];
        cell.titleLabel.text = @"转账给海的另一边";
        cell.moneyLabel.text = @"¥100.0";
        cell.detailLabel.text = @"DNAER转账";
    }else if (indexPath.row ==10){
        
        cell.BGImage.image = [UIImage imageNamed:@"file_chat"];
        cell.titleLabel.text = @"DNAER开发手册.doc";
        cell.moneyLabel.text = @"";
        cell.detailLabel.text = @"12.5MB";
    }else if (indexPath.row ==11){
        
        cell.BGImage.image = [UIImage imageNamed:@"5"];
        cell.titleLabel.text = @"纸鸢";
        cell.moneyLabel.text = @"DNAER ID:12643";
        cell.detailLabel.text = @"DNAER名片";
    }
    return cell;
    
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
