//
//  ActivityDetailViewController.m
//  Douban
//
//  Created by 祝福 on 16/3/11.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "DetaillView.h"

@interface ActivityDetailViewController ()


@end

@implementation ActivityDetailViewController
{
    UIScrollView * _scrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=_mode.title;
    

    [self createNavigationBar ];
    [self showUpView ];
    
    
    
}
-(void)createNavigationBar{

    UIBarButtonItem * left=[Help setBarButtonItem:nil image:@"btn_nav_back" callBack:@selector(leftButtonClick) target:self];
    self.navigationItem.leftBarButtonItem=left;
    
    UIBarButtonItem * right=[Help setBarButtonItem:nil image:@"btn_nav_share" callBack:@selector(rightButtonClick) target:self];
    self.navigationItem.rightBarButtonItem=right;
    

}
-(void)leftButtonClick{
    
    [self.navigationController popViewControllerAnimated:YES ];
}
-(void)rightButtonClick{

    
}
-(void)showUpView{
    DetaillView * upView=[[[NSBundle mainBundle]loadNibNamed:@"DetaillView" owner:nil options:nil ]lastObject ];
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WITCH, HEIGHT) ];
    [self.view addSubview:_scrollView ];
    [_scrollView addSubview:upView ];
//    _upView.backgroundColor=[UIColor blueColor];
//    [_upView setTranslatesAutoresizingMaskIntoConstraints:NO ];
//    __weak typeof(self) weakSelf=self;
//    [_upView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        //make.top.equalTo(weakSelf.view).with.offset(0);
//        make.left.equalTo(weakSelf.view).with.offset(20);
//        //make.bottom.equalTo(weakSelf.view).with.offset(0);
//        //make.right.equalTo(weakSelf.view).with.offset(0);
//
//        
//    } ];
    
    upView.titleD.text=_mode.title;
    [upView.image sd_setImageWithURL:[NSURL URLWithString:_mode.image]];
    upView.begin_time.text=[Help stringComponetsString:_mode.begin_time];
    upView.end_time.text=[Help stringComponetsString:_mode.end_time];
    upView.name.text=_mode.owner[@"name"];
    upView.category_name.text=_mode.category_name;
    
    
    
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
//    
//    CGSize maxSize = CGSizeMake(WITCH , MAXFLOAT);
//    
//    CGSize size = [self.mode.address boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
//    self.address.frame=CGRectMake(0, 0, WITCH, size.height+100);
//    _address.numberOfLines=0;
//    _address.backgroundColor=[UIColor blueColor];
    upView.address.text=_mode.address;
    
    UILabel * introLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 230, WITCH-20, 30) ];
    introLabel.text=@"活动介绍";
    introLabel.font=[UIFont boldSystemFontOfSize:20];
    [_scrollView addSubview:introLabel ];
    
    
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
        CGSize maxSize = CGSizeMake(WITCH , MAXFLOAT);
        CGSize size = [_mode.content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    NSLog(@"%f",size.height);
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 270, WITCH-20, size.height+50)];
    label.text=_mode.content;
    label.font=[UIFont systemFontOfSize:13];
    label.numberOfLines=0;
    [_scrollView addSubview:label ];
    _scrollView.contentSize=CGSizeMake(WITCH, size.height+400);
    
    
    
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
