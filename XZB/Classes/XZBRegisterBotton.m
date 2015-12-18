//
//  XZBRegisterBotton.m
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBRegisterBotton.h"
#define XZBTextFieldFont [UIFont fontWithName:nil size:15]
#define XZBBtnFont [UIFont fontWithName:nil size:13]
#define XZBTitleFont [UIFont fontWithName:nil size:15]
#define viewBorder 15
#define minViewBorder 5
#define maxViewBorder 35
@implementation XZBRegisterBotton

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
    
    XZBBaseGreenTextField *phoneNumber = [[XZBBaseGreenTextField alloc] init];
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat phoneNumberW = 200;
    CGFloat phoneNumberH = 40;
    CGFloat phoneNumberX = (viewW - phoneNumberW)/2;
    CGFloat phoneNumberY = 0;
    CGRect phoneNumberFrame =CGRectMake(phoneNumberX, phoneNumberY, phoneNumberW, phoneNumberH);
    [phoneNumber initWithFrame:phoneNumberFrame Title:@"手机号" Font:XZBTextFieldFont IsPassWord:NO];
    [self addSubview:phoneNumber];
    self.phoneNumber = phoneNumber;
    
    XZBBaseGreenTextField *passWord = [[XZBBaseGreenTextField alloc] init];
    CGFloat passWordW = phoneNumberW;
    CGFloat passWordH = phoneNumberH;
    CGFloat passWordX = (viewW - phoneNumberW)/2;
    CGFloat passWordY = CGRectGetMaxY(phoneNumber.frame) + viewBorder;
    CGRect passWordFrame =CGRectMake(passWordX, passWordY, passWordW, passWordH);
    [passWord initWithFrame:passWordFrame Title:@"密码" Font:XZBTextFieldFont IsPassWord:YES];
    [self addSubview:passWord];
    self.passWord = passWord;
    
    XZBBaseGreenTextField *checkPassWord = [[XZBBaseGreenTextField alloc] init];
    CGFloat checkPassWordW = passWordW;
    CGFloat checkPassWordH = passWordH;
    CGFloat checkPassWordX = (viewW - checkPassWordW)/2;
    CGFloat checkPassWordY = CGRectGetMaxY(passWord.frame) + viewBorder;
    CGRect checkPassWordFrame =CGRectMake(checkPassWordX, checkPassWordY, checkPassWordW, checkPassWordH);
    [checkPassWord initWithFrame:checkPassWordFrame Title:@"确认密码" Font:XZBTextFieldFont IsPassWord:YES];
    [self addSubview:checkPassWord];
    self.checkPassWord = checkPassWord;
    
    XZBBaseGreenTextField *userName = [[XZBBaseGreenTextField alloc] init];
    CGFloat userNameW = checkPassWordW;
    CGFloat userNameH = checkPassWordH;
    CGFloat userNameX = (viewW - userNameW)/2;
    CGFloat userNameY = CGRectGetMaxY(checkPassWord.frame) + viewBorder;
    CGRect userNameFrame =CGRectMake(userNameX, userNameY, userNameW, userNameH);
    [userName initWithFrame:userNameFrame Title:@"用户名（不能中文）" Font:XZBTextFieldFont IsPassWord:NO];
    [self addSubview:userName];
    self.userName = userName;
    
    XZBBaseGreenTextField *code = [[XZBBaseGreenTextField alloc] init];
    CGFloat codeW = userNameW;
    CGFloat codeH = userNameH;
    CGFloat codeX = (viewW - codeW)/2;
    CGFloat codeY = CGRectGetMaxY(userName.frame) + viewBorder;
    CGRect codeFrame =CGRectMake(codeX, codeY, codeW, codeH);
    [code initWithFrame:codeFrame Title:@"验证码" Font:XZBTextFieldFont IsPassWord:NO];
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
    
    UIButton *checkBox = [[UIButton alloc] init];
    CGFloat checkBoxX = codeX;
    CGFloat checkBoxY = CGRectGetMaxY(getCodeBtn.frame) + viewBorder;
    CGFloat checkBoxW = 25;
    CGFloat checkBoxH = 25;
    checkBox.frame = CGRectMake(checkBoxX, checkBoxY, checkBoxW, checkBoxH);
    [checkBox setBackgroundImage:[UIImage imageNamed:@"no_selected"] forState:UIControlStateNormal];
    [checkBox setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [checkBox setAdjustsImageWhenHighlighted:NO];
    [self addSubview:checkBox];
    self.checkBox = checkBox;
    
    NSString *readLaw1Name = @"我已阅读";
    UILabel *readLaw1 = [[UILabel alloc] init];
    CGSize readLaw1Size = [self sizeWithText:readLaw1Name font:XZBTitleFont];
    CGFloat readLaw1X = CGRectGetMaxX(checkBox.frame) + minViewBorder;
    CGFloat readLaw1Y = checkBoxY + (checkBoxH - readLaw1Size.height)/2;
    readLaw1.frame = CGRectMake(readLaw1X, readLaw1Y, readLaw1Size.width, readLaw1Size.height);
    readLaw1.font = XZBTitleFont;
    readLaw1.text = readLaw1Name;
    [self addSubview:readLaw1];
    self.readLaw1 = readLaw1;
    
    NSString *readLaw2Name = @"《新助邦会员协议》";
    UILabel *readLaw2 = [[UILabel alloc] init];
    CGSize readLaw2Size = [self sizeWithText:readLaw2Name font:XZBTitleFont];
    CGFloat readLaw2X = CGRectGetMaxX(readLaw1.frame) + minViewBorder;
    CGFloat readLaw2Y = readLaw1Y;
    readLaw2.frame = CGRectMake(readLaw2X, readLaw2Y, readLaw2Size.width, readLaw2Size.height);
    readLaw2.font = XZBTitleFont;
    readLaw2.text = readLaw2Name;
    readLaw2.textColor = [UIColor colorWithRed:78.0/255 green:214.0/255 blue:178.0/255 alpha:1];
    [self addSubview:readLaw2];
    self.readLaw2 = readLaw2;
    
    UIButton *registerBtn = [[UIButton alloc] init];
    CGFloat registerBtnW = 200;
    CGFloat registerBtnH = 50;
    CGFloat registerBtnX = (viewW - registerBtnW)/2;
    CGFloat registerBtnY = CGRectGetMaxY(checkBox.frame) + viewBorder;
    registerBtn.frame = CGRectMake(registerBtnX, registerBtnY, registerBtnW, registerBtnH);
    registerBtn.backgroundColor = [UIColor colorWithRed:78.0/255 green:214.0/255 blue:178.0/255 alpha:1];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = 5;
    registerBtn.layer.masksToBounds = YES;
    [self addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
    
    NSString *toLoginViewBtnName = @"已有账号，直接登录";
    UIButton *toLoginViewBtn = [[UIButton alloc] init];
    CGSize toLoginViewBtnSize = [self sizeWithText:toLoginViewBtnName font:XZBBtnFont];
    CGFloat toLoginViewBtnX = maxViewBorder;
    CGFloat toLoginViewBtnY = CGRectGetMaxY(registerBtn.frame) + viewBorder;
    toLoginViewBtn.frame = CGRectMake(toLoginViewBtnX, toLoginViewBtnY, toLoginViewBtnSize.width, toLoginViewBtnSize.height);
    toLoginViewBtn.backgroundColor = [UIColor clearColor];
    toLoginViewBtn.titleLabel.font = XZBBtnFont;
    [toLoginViewBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [toLoginViewBtn setTitle:toLoginViewBtnName forState:UIControlStateNormal];
    [self addSubview:toLoginViewBtn];
    self.toLoginViewBtn = toLoginViewBtn;
    
    
    NSString *toResetAccountViewBtnName = @"忘记密码？";
    UIButton *toResetAccountViewBtn = [[UIButton alloc] init];
    CGSize toResetAccountViewBtnSize = [self sizeWithText:toResetAccountViewBtnName font:XZBBtnFont];
    CGFloat toResetAccountViewBtnX = viewW - toResetAccountViewBtnSize.width - maxViewBorder;
    CGFloat toResetAccountViewBtnY = CGRectGetMaxY(registerBtn.frame) + viewBorder;
    toResetAccountViewBtn.frame = CGRectMake(toResetAccountViewBtnX, toResetAccountViewBtnY, toResetAccountViewBtnSize.width, toResetAccountViewBtnSize.height);
    toResetAccountViewBtn.backgroundColor = [UIColor clearColor];
    toResetAccountViewBtn.titleLabel.font = XZBBtnFont;
    [toResetAccountViewBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [toResetAccountViewBtn setTitle:toResetAccountViewBtnName forState:UIControlStateNormal];
    [self addSubview:toResetAccountViewBtn];
    self.toResetAccountViewBtn = toResetAccountViewBtn;
    //@property(nonatomic,weak)UIButton *toResetAccountViewBtn;
    
    return self;
}
@end
