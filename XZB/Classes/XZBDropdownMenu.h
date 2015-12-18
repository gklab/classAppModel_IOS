//
//  XZBDropdownMenu.h
//  XZB
//
//  Created by 王兆凯 on 15/8/7.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZBDropdownMenu : UIView
@property (nonatomic,strong) UIView *content;
@property (nonatomic,strong) UIViewController *contentController;
+ (instancetype) menu;
- (void) show;
- (void) dismiss;
@end
