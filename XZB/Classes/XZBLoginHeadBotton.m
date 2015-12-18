//
//  XZBLoginHeadBotton.m
//  XZB
//
//  Created by 王兆凯 on 15/9/4.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBLoginHeadBotton.h"
#define XZBGreen [UIColor colorWithRed:40.0/255 green:196.0/255 blue:168.0/255 alpha:1]
#define btnBorder 10
@implementation XZBLoginHeadBotton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init
{
    self = [super init];
    self.backgroundColor = [UIColor whiteColor];
    
    XZBCircleButton *qqLogin = [[XZBCircleButton alloc] init];
    CGFloat qqW = 90;
    CGFloat qqX = btnBorder * 3;
    CGFloat qqY = btnBorder * 6;
    qqLogin.frame = CGRectMake(qqX, qqY, qqW, qqW);
    qqLogin.backgroundColor = XZBGreen;
    UIImage *qqImg = [UIImage imageNamed:@"大圈主"];
    NSString *qqTitle = @"qq登录";
    [qqLogin setImage:qqImg withTitle:qqTitle forState:UIControlStateNormal buttonWidth:qqW];
    [self addSubview:qqLogin];
    self.qqLogin = qqLogin;
    
    XZBCircleButton *wechatLogin = [[XZBCircleButton alloc] init];
    CGFloat wechatW = 90;
    CGFloat wechatX = ([UIScreen mainScreen].bounds.size.width - wechatW)/2;
    CGFloat wechatY = btnBorder * 3;
    wechatLogin.frame = CGRectMake(wechatX, wechatY, wechatW, wechatW);
    wechatLogin.backgroundColor = XZBGreen;
    UIImage *wechatImg = [UIImage imageNamed:@"大圈主"];
    NSString *wechatTitle = @"微信登录";
    [wechatLogin setImage:wechatImg withTitle:wechatTitle forState:UIControlStateNormal buttonWidth:wechatW];
    [self addSubview:wechatLogin];
    self.wechatLogin = wechatLogin;
    
    
    XZBCircleButton *weiboLogin = [[XZBCircleButton alloc] init];
    CGFloat weiboW = 90;
    CGFloat weiboX = [UIScreen mainScreen].bounds.size.width - qqX - weiboW;
    CGFloat weiboY = qqY;
    weiboLogin.frame = CGRectMake(weiboX, weiboY, weiboW, weiboW);
    weiboLogin.backgroundColor = XZBGreen;
    UIImage *weiboImg = [UIImage imageNamed:@"大圈主"];
    NSString *weiboTitle = @"微博登录";
    [weiboLogin setImage:weiboImg withTitle:weiboTitle forState:UIControlStateNormal buttonWidth:weiboW];
    [self addSubview:weiboLogin];
    self.weiboLogin = weiboLogin;
    return self;
}
@end
