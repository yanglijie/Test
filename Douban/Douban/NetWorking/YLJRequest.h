//
//  YLJRequest.h
//  Douban
//
//  Created by 祝福 on 16/3/8.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLJRequest : NSObject



+(NSURLSessionDataTask *)getActivityAndBlock:(void (^) (id obj,NSError * error))block;

+(NSURLSessionDataTask *)getMovieAndBlock:(void (^) (id obj,NSError * error))block;

@end
