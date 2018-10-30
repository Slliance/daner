//
//  MineFriendController.m
//  daner
//
//  Created by 张舒 on 2018/10/27.
//  Copyright © 2018年 dnaer7. All rights reserved.
//

#import "MineFriendController.h"
#import "contactModel.h"
#import "NSArray+ContactArray.h"
#import "MJNIndexView.h"
#import "WPFPerson.h"
#import "WPFPinYinDataManager.h"
#import "WPFSearchResultViewController.h"
#import "MyFriendsCell.h"
#import "FriendHeadView.h"
#import "ScreenFriendCell.h"
#import "FriendDetailController.h"

@interface MineFriendController ()<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate,MJNIndexViewDataSource>{
    NSArray *defineDataArray;
}
@property (nonatomic, strong) UIFont *font;
@property(nonatomic,strong)  UITableView *tableView;
@property(nonatomic,strong)  NSMutableArray     *dataArray;
@property(nonatomic,strong)  NSArray *iconArr;
@property(nonatomic,strong)  NSArray *iconTitleArr;
@property(nonatomic,strong)  NSArray     *indexArray;
@property (nonatomic, strong) UISearchController *searchVC;
@property(nonatomic,strong) NSMutableArray    *filteredPersons;         //搜索过滤后  搜索结果
@property (nonatomic, strong) WPFSearchResultViewController *searchResultVC;
@property(nonatomic, strong) MJNIndexView *indexView;
@property(nonatomic,strong)FriendHeadView *headView;

@end

@implementation MineFriendController
-(FriendHeadView *)headView{
    if (!_headView) {
        _headView = [[FriendHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    }
    return _headView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconArr = @[@"invite_firend",@"group_friend",@"label_friend",@"find_friend"];
    self.iconTitleArr = @[@"邀请好友",@"群聊",@"分组与标签管理",@"发现好友"];
   [self setData];
}
#pragma mark--- UITableViewDataSource and UITableViewDelegate Methods---
//在tableview中有多少个分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==self.tableView) {
        return self.indexArray.count+2;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return self.iconArr.count+1;
    }else if (section ==1){
        return 1;
    }
    NSDictionary *dict = self.indexArray[section-2];
    return [dict[@"content"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    MyFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[MyFriendsCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section ==0) {
        if (indexPath.row<4) {
             [cell.reviewerBtn setImage:[UIImage imageNamed:self.iconArr[indexPath.row]] forState:UIControlStateNormal];
            cell.reviewerName.text = self.iconTitleArr[indexPath.row];
        }else{
            static NSString *identify = @"ScreenFriendCell";
            ScreenFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
            if (!cell) {
                cell = [[ScreenFriendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            }
            return cell;
        }
       
    }else if (indexPath.section ==1){
          [cell.reviewerBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
         cell.reviewerName.text = @"海的另一边";
    }else{
        contactModel *model;
        NSDictionary *dict = self.indexArray[indexPath.section-2];
        model=dict[@"content"][indexPath.row];
        cell.reviewerName.text=model.contactName;
        [cell.reviewerBtn setImage:[UIImage imageNamed:model.contactUrl] forState:UIControlStateNormal];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 60;
    }
    return 16;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc]init];
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, SCREENWIDTH-40, 16)];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = DSColorFromHex(0x969696);
    [view addSubview:label];
    if (section==0) {
        view.frame = CGRectMake(0, 0, SCREENWIDTH, 60);
        view.backgroundColor = [UIColor whiteColor];
       FriendHeadView* headView = [[FriendHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
        [view addSubview:headView];
    }else if (section ==1){
        view.frame =  CGRectMake(0, 0, SCREENWIDTH, 16);
        label.text = @"特别好友";
         view.backgroundColor = DSColorFromHex(0xFAFAFA);
    }else{
     label.text = [NSString stringWithFormat:@"%@",self.indexArray[section-2][@"firstLetter"]];
         view.backgroundColor = DSColorFromHex(0xFAFAFA);
         view.frame =  CGRectMake(0, 0, SCREENWIDTH, 16);
    }
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self.searchVC.searchBar resignFirstResponder];
//    [self.searchVC.searchBar setShowsCancelButton:NO animated:YES];
    if (indexPath.section==0) {
       
    }else{
        FriendDetailController *friendVC = [[FriendDetailController alloc]init];
        friendVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:friendVC animated:YES];
    }
   
}

#pragma mark - MJNIndexViewDataSource
- (NSArray *)sectionIndexTitlesForMJNIndexView:(MJNIndexView *)indexView
{
    NSMutableArray *resultArray =[NSMutableArray new];
    for (NSDictionary *dict in self.indexArray) {
        NSString *title = dict[@"firstLetter"];
        [resultArray addObject:title];
    }
    return resultArray;
}


- (void)sectionForSectionMJNIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition: UITableViewScrollPositionTop animated:self.getSelectedItemsAfterPanGestureIsFinished];
}

#pragma mark - UISearchBarDelegate & UISearchResultsUpdating & UISearchControllerDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchVC.searchBar setShowsCancelButton:YES animated:NO];
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [self.searchVC.searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
}
// 更新搜索结果
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *keyWord = searchController.searchBar.text.lowercaseString;
    NSLog(@"%@", keyWord);
    NSDate *beginTime = [NSDate date];
    NSLog(@"开始匹配，开始时间：%@", beginTime);
    NSMutableArray *resultDataSource = [NSMutableArray array];
    for (WPFPerson *person in [WPFPinYinDataManager getInitializedDataSource]) {
        WPFSearchResultModel *resultModel = [WPFPinYinTools searchEffectiveResultWithSearchString:keyWord Person:person];
        
        if (resultModel.highlightedRange.length) {
            person.highlightLoaction = resultModel.highlightedRange.location;
            person.textRange = resultModel.highlightedRange;
            person.matchType = resultModel.matchType;
            [resultDataSource addObject:person];
        }
    }
    self.searchResultVC.resultDataSource = resultDataSource;
    [self.searchResultVC.resultDataSource sortUsingDescriptors:[WPFPinYinTools sortingRules]];
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval costTime = [endTime timeIntervalSinceDate:beginTime];
    NSLog(@"匹配结束，结束时间：%@，耗时：%.4f", endTime, costTime);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.searchResultVC.tableView reloadData];
    });
}
- (void)willPresentSearchController:(UISearchController *)searchController {
    UITableView *resultTableView = self.searchResultVC.tableView;
    
    CGRect rect = resultTableView.frame;
    rect.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height +self.navigationController.navigationBar.frame.size.height;
    rect.size.height = [UIScreen mainScreen].bounds.size.height - rect.origin.y;
    resultTableView.frame = rect;
}
#pragma mark - 懒加载
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView  alloc] initWithFrame:CGRectMake(0,0,SCREENWIDTH, SCREENHEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MyFriendsCell class] forCellReuseIdentifier:@"REUSE_CELLID"];
        [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
        _tableView.contentSize=CGSizeMake(SCREENWIDTH,SCREENHEIGHT*2);
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.sectionIndexBackgroundColor=[UIColor clearColor];//索引背景色
        _tableView.separatorColor = [UIColor whiteColor];
        _tableView.sectionIndexColor=[UIColor redColor];//索引背景色
    }
    return _tableView;
}
- (WPFSearchResultViewController *)searchResultVC {
    if (!_searchResultVC) {
        _searchResultVC = [[WPFSearchResultViewController alloc] init];
        __weak typeof(self)wSelf = self;
        _searchResultVC.returnValueBlock = ^(NSString *name) {
            [wSelf scrollToIndexCellWithName:name];
            
        };
    }
    return _searchResultVC;
}
- (UISearchController *)searchVC {
    if (!_searchVC) {
        _searchVC = [[UISearchController alloc] initWithSearchResultsController:self.searchResultVC];
        _searchVC.hidesNavigationBarDuringPresentation = NO;
        // 是否添加半透明遮罩；默认为YES
        _searchVC.dimsBackgroundDuringPresentation = NO;
        // NO表示UISearchController在present时，可以覆盖当前controller，默认为NO
        _searchVC.definesPresentationContext = NO;
        _searchVC.searchResultsUpdater = self;
        _searchVC.searchBar.delegate = self;
        _searchVC.delegate = self;
    }
    return _searchVC;
}
#pragma mark - 索引样式
- (void)firstAttributesForMJNIndexView
{
    self.indexView.getSelectedItemsAfterPanGestureIsFinished = NO;
    self.indexView.font = [UIFont boldSystemFontOfSize:10];
    self.indexView.selectedItemFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0];
    self.indexView.backgroundColor = [UIColor clearColor];
    self.indexView.curtainColor = [UIColor whiteColor];
    self.indexView.curtainFade = 0.0;
    self.indexView.curtainStays = NO;
    self.indexView.curtainMoves = YES;
    self.indexView.curtainMargins = NO;
    self.indexView.ergonomicHeight = NO;
    self.indexView.upperMargin = 126;
    self.indexView.lowerMargin = 220;
    self.indexView.rightMargin = 10.0;
    self.indexView.itemsAligment = NSTextAlignmentCenter;
    self.indexView.maxItemDeflection = 80.0;
    self.indexView.rangeOfDeflection = 3;
    self.indexView.fontColor = DSColorFromHex(0x969696);
    self.indexView.selectedItemFontColor = [UIColor whiteColor];
    self.indexView.darkening = NO;
    self.indexView.fading = YES;
    
}
- (void)readAttributes
{
    self.getSelectedItemsAfterPanGestureIsFinished = self.indexView.getSelectedItemsAfterPanGestureIsFinished;
    self.font = self.indexView.font;
    self.selectedItemFont = self.indexView.selectedItemFont;
    self.fontColor = self.indexView.fontColor;
    self.selectedItemFontColor = self.indexView.selectedItemFontColor;
    self.darkening = self.indexView.darkening;
    self.fading = self.indexView.fading;
    self.itemsAligment = self.indexView.itemsAligment;
    self.rightMargin = self.indexView.rightMargin;
    self.upperMargin = self.indexView.upperMargin;
    self.lowerMargin = self.indexView.lowerMargin;
    self.maxItemDeflection = self.indexView.maxItemDeflection;
    self.rangeOfDeflection = self.indexView.rangeOfDeflection;
    self.curtainColor = self.indexView.curtainColor;
    self.curtainFade = self.indexView.curtainFade;
    self.curtainMargins = self.indexView.curtainMargins;
    self.curtainStays = self.indexView.curtainStays;
    self.curtainMoves = self.indexView.curtainMoves;
    self.ergonomicHeight = self.indexView.ergonomicHeight;
}
#pragma mark - Actions
- (void)scrollToIndexCellWithName:(NSString *)name{
    for (int i = 0; i < self.indexArray.count; i++) {
        NSDictionary *dict = self.indexArray[i];
        NSArray *array = dict[@"content"];
        for (int j = 0; j <array.count ; j++) {
            contactModel *model = array[j];
            if ([name isEqualToString:model.contactName]) {
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i] atScrollPosition: UITableViewScrollPositionTop animated:self.getSelectedItemsAfterPanGestureIsFinished];
                [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i] animated:YES scrollPosition:UITableViewScrollPositionTop];
            }
        }
    }
}
- (void)setData{
    defineDataArray=@[
                      @{ @"contact":@"简单",
                         @"conatctUrl":@"5"},
                      @{ @"contact":@"DNAER小助手",
                         @"conatctUrl":@"4"},
                      @{ @"contact":@"王二",
                         @"conatctUrl":@"3"},
                      @{ @"contact":@"jake",
                         @"conatctUrl":@"4"},
                      @{ @"contact":@"preyy2",
                         @"conatctUrl":@"5"},
                      @{ @"contact":@"杰西",
                         @"conatctUrl":@"4"},
                      @{ @"contact":@"lulu",
                         @"conatctUrl":@"3"},
                      @{ @"contact":@"哈尼",
                         @"conatctUrl":@"2"},
                      @{ @"contact":@"陆军",
                         @"conatctUrl":@"1"},
                      @{ @"contact":@"是的",
                         @"conatctUrl":@"1"},
                      @{ @"contact":@"身份",
                         @"conatctUrl":@"2"},
                      @{ @"contact":@"爱德华",
                         @"conatctUrl":@"4"},
                      @{ @"contact":@"阿花",
                         @"conatctUrl":@"5"},
                      @{ @"contact":@"梅长苏",
                         @"conatctUrl":@"5"},
                      @{ @"contact":@"杨戬",
                         @"conatctUrl":@"2"},
                      @{ @"contact":@"大V哥",
                         @"conatctUrl":@"1"},
                      @{ @"contact":@"C罗",
                         @"conatctUrl":@"1"},
                      @{ @"contact":@"Edison 陈冠希",
                         @"conatctUrl":@"3"},
                      @{ @"contact":@"方杰",
                         @"conatctUrl":@"4"},
                      @{ @"contact":@"GAI",
                         @"conatctUrl":@"5"},
                      @{ @"contact":@"Nike",
                         @"conatctUrl":@"2"},
                      @{ @"contact":@"Mery",
                         @"conatctUrl":@"1"},
                      @{ @"contact":@"西西",
                         @"conatctUrl":@"5"},
                      @{ @"contact":@"501房东",
                         @"conatctUrl":@"5"},
                      ];
    [self.view addSubview:[UIView new]];
    _filteredPersons = [NSMutableArray array];
    _dataArray=[NSMutableArray array];
    for (NSDictionary *dict in defineDataArray) {
        contactModel  *model = [[contactModel alloc] init];
        model.contactName=dict[@"contact"];
        model.contactUrl=dict[@"conatctUrl"];
        [_dataArray addObject:model];
    }
    //索引
    self.indexArray=[self.dataArray arrayWithPinYinFirstLetter];
    for (NSInteger i = 0; i < self.dataArray.count; ++i) {
        @autoreleasepool {
            contactModel *model = self.dataArray[i];
            NSString *name = model.contactName;
            [WPFPinYinDataManager addInitializeString:name identifer:[@(i) stringValue]];
        }
    }
    self.tableView.keyboardDismissMode=UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:self.tableView];
    
    self.indexView = [[MJNIndexView alloc]initWithFrame:self.tableView.frame];
    self.indexView.dataSource = self;
    [self firstAttributesForMJNIndexView];
    [self readAttributes];
    [self.view addSubview:self.indexView];
    self.navigationItem.titleView = self.searchVC.searchBar;
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
