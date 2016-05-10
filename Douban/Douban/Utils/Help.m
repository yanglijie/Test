//
//  Help.m
//  Douban
//
//  Created by 祝福 on 16/3/8.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "Help.h"

@implementation Help


+(NSString *)stringComponetsString:(NSString *)str{


    
    NSString * string=[str substringWithRange:NSMakeRange(5, 11)];
    
    return string;
}

+(UIBarButtonItem *)setBarButtonItem:(NSString *)title image:(NSString *)image callBack:(SEL)callback  target:(id)target{
    
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 30, 25);
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置回调
    [button addTarget:target action:callback forControlEvents:UIControlEventTouchUpInside];
    //自定义BarButton
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithCustomView:button];
    
    return item;
}

@end
