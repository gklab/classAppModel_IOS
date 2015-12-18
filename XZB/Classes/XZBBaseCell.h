//
//  XZBBaseCell.h
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBBaseCellFrame.h"
@interface XZBBaseCell : UITableViewCell
@property (nonatomic,strong) XZBBaseCellFrame *baseCellFrame;
+ (instancetype)initWithTableView:(UITableView *)tableView btnNum:(NSUInteger)num;
@end
