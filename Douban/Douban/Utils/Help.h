//
//  Help.h
//  Douban
//
//  Created by 祝福 on 16/3/8.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Help : NSObject


+(NSString *)stringComponetsString:(NSString *)str;

//添加NavigationBar
+(UIBarButtonItem *)setBarButtonItem:(NSString *)title image:(NSString *)image callBack:(SEL)callback  target:(id)target;

@end
