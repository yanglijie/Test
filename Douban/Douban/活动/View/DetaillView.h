//
//  DetaillView.h
//  Douban
//
//  Created by 祝福 on 16/3/17.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetaillView : UIView




@property (weak, nonatomic) IBOutlet UILabel *titleD;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *begin_time;
@property (weak, nonatomic) IBOutlet UILabel *end_time;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *category_name;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
