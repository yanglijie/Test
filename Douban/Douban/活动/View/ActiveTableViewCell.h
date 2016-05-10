//
//  ActiveTableViewCell.h
//  Douban
//
//  Created by 祝福 on 16/3/7.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *begin_time;
@property (weak, nonatomic) IBOutlet UILabel *end_time;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *category_name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *wisher_count;
@property (weak, nonatomic) IBOutlet UILabel *participant_count;

@end
