//
//  MovieTableViewCell.h
//  Douban
//
//  Created by 祝福 on 16/3/17.
//  Copyright © 2016年 祝福. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic_url;
@property (weak, nonatomic) IBOutlet UILabel *movieName;

@end
