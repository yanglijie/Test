//
//  MovieViewController.m
//  Douban
//
//  Created by 祝福 on 16/3/7.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"

@interface MovieViewController ()

@end

@implementation MovieViewController
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    
    
    
}
-(void)requestData{
    
    
    __weak __typeof(self) weakSelf=self;
    [YLJRequest getMovieAndBlock:^(id obj, NSError *error) {
        _dataArray=obj;
        [weakSelf createTableView ];
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } ];
    
}


-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WITCH, HEIGHT-64) style:UITableViewStylePlain ];
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    

    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MovieTableViewCell" owner:nil options:nil ]firstObject ];
    }
    
    MovieModel * model=_dataArray[indexPath.row];
    [cell.pic_url sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    cell.movieName.text=model.movieName;

    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    ActivityDetailViewController * vc=[[ActivityDetailViewController alloc]init ];
//    vc.mode=_dataArray[indexPath.row];
//    vc.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:vc animated:YES ];
    
    
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
