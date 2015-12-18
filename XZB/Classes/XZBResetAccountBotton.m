//
//  XZBResetAccountBotton.m
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBResetAccountBotton.h"
#define XZBTitleFont [UIFont fontWithName:nil size:17]
#define XZBTextFieldFont [UIFont fontWithName:nil size:15]
#define XZBBtnFont [UIFont fontWithName:nil size:13]
#define viewBorder 15
#define minViewBorder 5
#define maxViewBorder 35
@implementation XZBResetAccountBotton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    return [self sizeWithText:text font:font maxW:MAXFLOAT];
}
-(instancetype)init
{
    self = [super init];
    self.backgroundColor = [UIColor whiteColor];
    
    NSString *topLableName = @"重置密码";
    UILabel *topLable = [[UILabel alloc] init];
    CGSize topLableSize = [self sizeWithText:topLableName font:XZBTitleFont];
    CGFloat topLableX = maxViewBorder;
    CGFloat topLableY = 0;
    topLable.frame = CGRectMake(topLableX, topLableY, topLableSize.width, topLableSize.height);
    topLable.font = XZBTitleFont;
    topLable.text = topLableName;
    [self addSubview:topLable];
    self.topLable = topLable;
    
    XZBBaseGreenTextField *phoneNumber = [[XZBBaseGreenTextField alloc] init];
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat phoneNumberW = 200;
    CGFloat phoneNumberH = 40;
    CGFloat phoneNumberX = (viewW - phoneNumberW)/2;
    CGFloat phoneNumberY = CGRectGetMaxY(topLable.frame) + viewBorder;
    CGRect phoneNumberFrame =CGRectMake(phoneNumberX, phoneNumberY, phoneNumberW, phoneNumberH);
    [phoneNumber initWithFrame:phoneNumberFrame Title:@"输入手机号" Font:XZBTextFieldFont IsPassWord:NO];
    [self addSubview:phoneNumber];
    
    XZBBaseGreenTextField *code = [[XZBBaseGreenTextField alloc] init];
    CGFloat codeW = phoneNumberW;
    CGFloat codeH = phoneNumberH;
    CGFloat codeX = (viewW - phoneNumberW)/2;
    CGFloat codeY = CGRectGetMaxY(phoneNumber.frame) + viewBorder;
    CGRect codeFrame =CGRectMake(codeX, codeY, codeW, codeH);
    [code initWithFrame:codeFrame Title:@"输入验证码" Font:XZBTextFieldFont IsPassWord:NO];
    [self addSubview:code];
    self.code = code;
    
    UIButton *getCodeBtn = [[UIButton alloc] init];
    CGFloat getCodeBtnW = 160;
    CGFloat getCodeBtnH = 24;
    CGFloat getCodeBtnX = (viewW - getCodeBtnW)/2;
    CGFloat getCodeBtnY = CGRectGetMaxY(code.frame) + viewBorder;
    getCodeBtn.frame =CGRectMake(getCodeBtnX, getCodeBtnY, getCodeBtnW, getCodeBtnH);
    getCodeBtn.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1];
    getCodeBtn.layer.cornerRadius = 10;
    getCodeBtn.layer.masksToBounds = YES;
    [getCodeBtn setTitle:@"免费获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:[UIColor colorWithRed:160.0/255 green:160.0/255 blue:160.0/255 alpha:1] forState:UIControlStateNormal];
    getCodeBtn.titleLabel.font = XZBBtnFont;
    [self addSubview:getCodeBtn];
    self.getCodeBtn = getCodeBtn;
    
    XZBBaseGreenTextField *passWord = [[XZBBaseGreenTextField alloc] init];
    CGFloat passWordW = codeW;
    CGFloat passWordH = codeH;
    CGFloat passWordX = (viewW - passWordW)/2;
    CGFloat passWordY = CGRectGetMaxY(getCodeBtn.frame) + viewBorder;
    CGRect passWordFrame =CGRectMake(passWordX, passWordY, passWordW, passWordH);
    [passWord initWithFrame:passWordFrame Title:@"输入新密码" Font:XZBTextFieldFont IsPassWord:YES];
    [self addSubview:passWord];
    self.passWord = passWord;
    
    XZBBaseGreenTextField *checkPassWord = [[XZBBaseGreenTextField alloc] init];
    CGFloat checkPassWordW = passWordW;
    CGFloat checkPassWordH = passWordH;
    CGFloat checkPassWordX = (viewW - checkPassWordW)/2;
    CGFloat checkPassWordY = CGRectGetMaxY(passWord.frame) + viewBorder;
    CGRect checkPassWordFrame =CGRectMake(checkPassWordX, checkPassWordY, checkPassWordW, checkPassWordH);
    [checkPassWord initWithFrame:checkPassWordFrame Title:@"再次输入新密码" Font:XZBTextFieldFont IsPassWord:YES];
    [self addSubview:checkPassWord];
    self.checkPassWord = checkPassWord;
    
    UIButton *okBtn = [[UIButton alloc] init];
    CGFloat okBtnW = 200;
    CGFloat okBtnH = 50;
    CGFloat okBtnX = (viewW - okBtnW)/2;
    CGFloat okBtnY = CGRectGetMaxY(checkPassWord.frame) + viewBorder;
    okBtn.frame = CGRectMake(okBtnX, okBtnY, okBtnW, okBtnH);
    okBtn.backgroundColor = [UIColor colorWithRed:78.0/255 green:214.0/255 blue:178.0/255 alpha:1];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn setTitle:@"完成" forState:UIControlStateNormal];
    okBtn.layer.cornerRadius = 5;
    okBtn.layer.masksToBounds = YES;
    [self addSubview:okBtn];
    self.okBtn = okBtn;
    return self;
}
@end
