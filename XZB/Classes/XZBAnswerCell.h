//
//  XZBAnswerCell.h
//  XZB
//
//  Created by 王兆凯 on 15/8/18.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XZBInfoFrame;
@interface XZBAnswerCell : UITableViewCell
+ (instancetype)initWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) XZBInfoFrame *infoFrame;
@end
