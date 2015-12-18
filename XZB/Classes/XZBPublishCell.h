//
//  XZBPublishCell.h
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBPublishFrame.h"
@interface XZBPublishCell : UITableViewCell
@property (nonatomic,strong) XZBPublishFrame *publishFrame;
+ (instancetype)initWithTableView:(UITableView *)tableView;
@end
