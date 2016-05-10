//
//  RootViewController.m
//  Douban
//
//  Created by 祝福 on 16/3/7.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBar];
    
}
-(void)createTabBar{
    NSArray * classArray=@[@"ActiveViewController",@"MovieViewController",@"TheatreViewController",@"MyViewController"];
    NSArray * textArray=@[@"活动",@"电影",@"影院",@"我的"];
    
    NSArray * imageArray=@[@"activity",@"cinema",@"movie",@"user"];
    
    NSMutableArray * arr=[NSMutableArray array];
    for (int i=0; i<[classArray count]; i++) {
        NSString * string=[NSString stringWithFormat:@"%@",classArray[i]];
        Class aclass=NSClassFromString(string);
        UIViewController * vc=[[aclass alloc] init ];
        vc.tabBarItem=[[UITabBarItem alloc]initWithTitle:textArray[i] image:[UIImage imageNamed:imageArray[i]] tag: 10+i];
        
        UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:vc ];
        
        UINavigationBar * bar=vc.navigationController.navigationBar;
        [bar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault ];
        
        vc.title=textArray[i];
        
        [arr addObject:nav ];
        
    }
    
    self.viewControllers=arr;
    
    
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
