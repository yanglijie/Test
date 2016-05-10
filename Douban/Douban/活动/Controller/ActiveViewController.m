//
//  ActiveViewController.m
//  Douban
//
//  Created by 祝福 on 16/3/7.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "ActiveViewController.h"
#import "ActiveTableViewCell.h"
#import "ActivityMode.h"
#import "ActivityDetailViewController.h"

@interface ActiveViewController ()

@end

@implementation ActiveViewController
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    _dataArray=[NSMutableArray array];
    
    [self requestData ];
    
}
//网络请求
-(void)requestData{
    __weak __typeof(self) weakSelf=self;
    [YLJRequest getActivityAndBlock:^(id obj, NSError *error) {
        _dataArray=obj;
        [weakSelf createTableView ];
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } ];
    
}
//TableView的创建
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WITCH, HEIGHT-64) style:UITableViewStylePlain ];
    //_tableView的代理
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
     __weak typeof(self) weakSelf=self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
                make.top.equalTo(weakSelf.view).with.offset(0);
                make.left.equalTo(weakSelf.view).with.offset(0);
                make.bottom.equalTo(weakSelf.view).with.offset(0);
                make.right.equalTo(weakSelf.view).with.offset(0);
        
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
        
        
    } ];
    
}
//返回几行cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
//返回每一行cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
//返回每一行cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActiveTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"ActiveTableViewCell" owner:nil options:nil ]firstObject ];
    }
    
    ActivityMode * model=_dataArray[indexPath.row];
    cell.title.text=model.title;
    cell.begin_time.text=[Help stringComponetsString:model.begin_time];
    cell.end_time.text=[Help stringComponetsString:model.end_time];
    cell.address.text=model.address;
    cell.category_name.text=model.category_name;
    cell.participant_count.text=[NSString stringWithFormat:@"%@",model.participant_count];
    cell.wisher_count.text=[NSString stringWithFormat:@"%@",model.wisher_count];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:model.image]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
//点击每一个cell所触发的事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ActivityDetailViewController * vc=[[ActivityDetailViewController alloc]init ];
    vc.mode=_dataArray[indexPath.row];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES ];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
