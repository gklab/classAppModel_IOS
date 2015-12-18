//
//  XZBMyInfoCell.h
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBMyInfoFrame.h"
@interface XZBMyInfoCell : UITableViewCell
@property (nonatomic,strong) XZBMyInfoFrame *myInfoFrame;
+ (instancetype)initWithTableView:(UITableView *)tableView;
@end
