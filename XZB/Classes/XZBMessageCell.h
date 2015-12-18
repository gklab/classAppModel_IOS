//
//  XZBMessageCell.h
//  XZB
//
//  Created by 王兆凯 on 15/8/30.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBMessageFrame.h"
@interface XZBMessageCell : UITableViewCell
@property (nonatomic,strong) XZBMessageFrame *messageFrame;
+ (instancetype)initWithTableView:(UITableView *)tableView;
@end
