//
//  XZBLoginBotton.m
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBLoginBotton.h"
#define XZBBtnFont [UIFont fontWithName:nil size:15]
#define viewBorder 20
#define minViewBorder 10
#define maxViewBorder 50
@interface XZBLoginBotton()
@end
@implementation XZBLoginBotton

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
    
    XZBBaseGreenTextField *userName = [[XZBBaseGreenTextField alloc] init];
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat userNameW = 200;
    CGFloat userNameH = 40;
    CGFloat userNameX = (viewW - userNameW)/2;
    CGFloat userNameY = 0;
    CGRect userNameFrame =CGRectMake(userNameX, userNameY, userNameW, userNameH);
    [userName initWithFrame:userNameFrame Title:@"用户名" Font:XZBBtnFont IsPassWord:NO];
    [self addSubview:userName];
    self.userName = userName;
    
    XZBBaseGreenTextField *passWord = [[XZBBaseGreenTextField alloc] init];
    CGFloat passWordW = userNameW;
    CGFloat passWordH = userNameH;
    CGFloat passWordX = (viewW - passWordW)/2;
    CGFloat passWordY = CGRectGetMaxY(userNameFrame) + viewBorder;
    CGRect passWordFrame =CGRectMake(passWordX, passWordY, passWordW, passWordH);
    [passWord initWithFrame:passWordFrame Title:@"密码" Font:XZBBtnFont IsPassWord:YES];
    [self addSubview:passWord];
    self.passWord = passWord;
    
    NSString *registerBtnTitle = @"注册";
    UIButton *registerBtn = [[UIButton alloc] init];
    registerBtn.backgroundColor = [UIColor clearColor];
    [registerBtn setTitle:registerBtnTitle forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor colorWithRed:77.0/255 green:75.0/255 blue:74.0/255 alpha:1] forState:UIControlStateNormal];
    CGSize registerBtnSize = [self sizeWithText:registerBtnTitle font:XZBBtnFont];
    CGFloat registerBtnX = passWordX;
    CGFloat registerBtnY = CGRectGetMaxY(passWordFrame) + minViewBorder;
    registerBtn.frame = CGRectMake(registerBtnX, registerBtnY, registerBtnSize.width, registerBtnSize.height);
    registerBtn.titleLabel.font = XZBBtnFont;
    [self addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
    NSString *resetAccountBtnTitle = @"忘记密码?";
    UIButton *resetAccountBtn = [[UIButton alloc] init];
    resetAccountBtn.backgroundColor = [UIColor clearColor];
    [resetAccountBtn setTitle:resetAccountBtnTitle forState:UIControlStateNormal];
    [resetAccountBtn setTitleColor:[UIColor colorWithRed:148.0/255 green:147.0/255 blue:146.0/255 alpha:1] forState:UIControlStateNormal];
    CGSize resetAccountBtnSize = [self sizeWithText:resetAccountBtnTitle font:XZBBtnFont];
    CGFloat resetAccountBtnX = CGRectGetMaxX(passWordFrame) - resetAccountBtnSize.width;
    CGFloat resetAccountBtnY = registerBtnY;
    resetAccountBtn.frame = CGRectMake(resetAccountBtnX, resetAccountBtnY, resetAccountBtnSize.width, resetAccountBtnSize.height);
    resetAccountBtn.titleLabel.font = XZBBtnFont;
    [self addSubview:resetAccountBtn];
    self.resetAccountBtn = resetAccountBtn;
    
    XZBChoseStatus *choseStudent = [[XZBChoseStatus alloc] init];
    CGFloat choseStudentX = viewBorder;
    CGFloat choseStudentY = CGRectGetMaxY(registerBtn.frame) + maxViewBorder;
    CGFloat choseStudentW = 150;
    CGFloat choseStudentH = 130;
    choseStudent.frame = CGRectMake(choseStudentX, choseStudentY, choseStudentW, choseStudentH);
    [choseStudent initWithImgName:@"大圈主" ChoseTitle:@"选择学生身份" TipTitle:@"购买资料，寻求帮助"];
    [self addSubview:choseStudent];
    self.choseStudent = choseStudent;
    
    XZBChoseStatus *choseTeacher = [[XZBChoseStatus alloc] init];
    CGFloat choseTeacherW = choseStudentW;
    CGFloat choseTeacherH = choseStudentH;
    CGFloat choseTeacherX = viewW - choseTeacherW - viewBorder;
    CGFloat choseTeacherY = choseStudentY;
    choseTeacher.frame = CGRectMake(choseTeacherX, choseTeacherY, choseTeacherW, choseTeacherH);
    [choseTeacher initWithImgName:@"大圈主" ChoseTitle:@"选择老师身份" TipTitle:@"出售资料，辅导考研学生"];
    [self addSubview:choseTeacher];
    self.choseTeacher = choseTeacher;
    
    UIButton *loginBtn = [[UIButton alloc] init];
    CGFloat loginBtnW = 200;
    CGFloat loginBtnH = 50;
    CGFloat loginBtnX = (viewW - loginBtnW)/2;
    CGFloat loginBtnY = CGRectGetMaxY(choseTeacher.frame) + viewBorder;
    loginBtn.frame = CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH);
    loginBtn.backgroundColor = [UIColor colorWithRed:78.0/255 green:214.0/255 blue:178.0/255 alpha:1];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [self addSubview:loginBtn];
    self.loginBtn =loginBtn;
    return self;
}

@end
