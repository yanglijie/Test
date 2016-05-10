//
//  YLJRequest.m
//  Douban
//
//  Created by 祝福 on 16/3/8.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import "YLJRequest.h"
#import "UrlHeader.h"
#import <AFHTTPSessionManager.h>
#import "ActivityMode.h"
#import "MovieModel.h"

@implementation YLJRequest
//封装一个方法，网络下载的数据直接解析，如果下载成功，返回一个model
+(NSURLSessionDataTask *)getActivityAndBlock:(void (^) (id obj,NSError * error))block{
    
    
    NSString * path=[NSString stringWithFormat:@"%@",UrlActivity];
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    return [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //判断请求下来的数据是不是字典
        if ([responseObject isKindOfClass:[NSDictionary class] ]) {
            
            NSArray * arr=responseObject[@"events"];
            NSMutableArray * applications=[NSMutableArray array];
            for (NSDictionary * dic in arr) {
                ActivityMode * mode=[ActivityMode applicationWithDic:dic];
                [applications addObject:mode ];
            }
            
            if (block) {
                block(applications,nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //如果请求失败，返回失败的原因
        NSLog(@"%@",error);
        
    } ];
    
}

+(NSURLSessionDataTask *)getMovieAndBlock:(void (^) (id obj,NSError * error))block{

    NSString * path=[NSString stringWithFormat:@"%@",UrlMovie];
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    return [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

        
        if ([responseObject isKindOfClass:[NSDictionary class] ]) {
            
            NSArray * arr=responseObject[@"result"];
            NSMutableArray * applications=[NSMutableArray array];
            for (NSDictionary * dic in arr) {
                 MovieModel* mode=[MovieModel applicationWithDic:dic];
                [applications addObject:mode ];
            }
            
            if (block) {
                block(applications,nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        NSLog(@"%@",error);
        
    } ];


}



@end
