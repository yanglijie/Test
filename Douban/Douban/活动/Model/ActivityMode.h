//
//  ActivityMode.h
//  Douban
//
//  Created by 祝福 on 16/3/8.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityMode : NSObject



@property (copy, nonatomic)  NSString *title;
@property (copy, nonatomic)  NSString *begin_time;
@property (copy, nonatomic)  NSString *end_time;
@property (copy, nonatomic)  NSString *address;
@property (copy, nonatomic)  NSString *category_name;
@property (copy, nonatomic)  NSString *image;
@property (copy, nonatomic)  NSString *wisher_count;
@property (copy, nonatomic)  NSString *participant_count;
@property (copy, nonatomic)  NSString *content;
@property (copy, nonatomic)  NSDictionary *owner;


-(instancetype)initWithDic:(NSDictionary *)dic;
//一个初始化方法对应一个工厂方法
+(ActivityMode *)applicationWithDic:(NSDictionary *)dic;


@end
