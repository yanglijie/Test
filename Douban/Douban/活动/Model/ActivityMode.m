//
//  ActivityMode.m
//  Douban
//
//  Created by 祝福 on 16/3/8.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "ActivityMode.h"

@implementation ActivityMode

-(id)valueForUndefinedKey:(NSString *)key{
    //防止别人用不存在的Value值查询
    //防止崩溃
    return nil;
}
//当字典有某一个key，但数据模型里面的属性没有对应同名的属性，这个时候就会调用下面的方法，所以下载的方法必须重写，否则会崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    //定义的String和key不一致
    //NSLog(@"%@      %@",key,value);
    //    if ([key isEqualToString:@"description" ]) {
    //        self.des=value;
    //    }
    
}
-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
    
}
//一个初始化方法对应一个工厂方法
+(ActivityMode *)applicationWithDic:(NSDictionary *)dic{
    ActivityMode * house=[[ActivityMode alloc]initWithDic:dic ];
    return house;
}



@end
