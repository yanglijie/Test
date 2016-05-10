//
//  MovieModel.h
//  Douban
//
//  Created by 祝福 on 16/3/17.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

@property (copy, nonatomic)  NSString *movieId;
@property (copy, nonatomic)  NSString *movieName;
@property (copy, nonatomic)  NSString *pic_url;


-(instancetype)initWithDic:(NSDictionary *)dic;
//一个初始化方法对应一个工厂方法
+(MovieModel *)applicationWithDic:(NSDictionary *)dic;

@end
