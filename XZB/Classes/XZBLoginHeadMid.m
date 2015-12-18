//
//  XZBLoginHeadMid.m
//  XZB
//
//  Created by 王兆凯 on 15/9/4.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBLoginHeadMid.h"
#define blockBtnW 220
#define blockBtnH 50
#define viewBorder 20
@implementation XZBLoginHeadMid

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
    
    UIButton *registerBtn = [[UIButton alloc] init];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    registerBtn.backgroundColor = [UIColor colorWithRed:62.0/255 green:153.0/255 blue:172.0/255 alpha:1];
    registerBtn.layer.cornerRadius = 10;
    registerBtn.layer.masksToBounds = YES;
    CGFloat registerBtnX = ([UIScreen mainScreen].bounds.size.width - blockBtnW)/2;
    CGFloat registerBtnY = 0;
    CGFloat registerBtnW = blockBtnW;
    CGFloat registerBtnH = blockBtnH;
    registerBtn.frame = CGRectMake(registerBtnX, registerBtnY, registerBtnW, registerBtnH);
    [self addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"已有新助邦账号，登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    loginBtn.backgroundColor = [UIColor colorWithRed:40.0/255 green:196.0/255 blue:168.0/255 alpha:1];
    loginBtn.layer.cornerRadius = 10;
    loginBtn.layer.masksToBounds = YES;
    CGFloat loginBtnX = registerBtnX;
    CGFloat loginBtnY = CGRectGetMaxY(registerBtn.frame) +viewBorder;
    CGFloat loginBtnW = blockBtnW;
    CGFloat loginBtnH = blockBtnH;
    loginBtn.frame = CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH);
    [self addSubview:loginBtn];
    self.loginBtn = loginBtn;
    

    return self;
}
@end
