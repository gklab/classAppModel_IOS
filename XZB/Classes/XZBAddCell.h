//
//  XZBAddCell.h
//  XZB
//
//  Created by 王兆凯 on 15/9/1.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBAddCellFrame.h"
@interface XZBAddCell : UITableViewCell
@property (nonatomic,strong) XZBAddCellFrame *addCellFrame;
@property (nonatomic,weak) UIImageView *rightImageView;
+ (instancetype)initWithTableView:(UITableView *)tableView;
@end
