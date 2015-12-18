//
//  XZBLoginViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/9/4.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBLoginViewController.h"
#import "XZBLoginBotton.h"
#import "XZBRegisterViewController.h"
#import "XZBResetAccountViewController.h"
#include "XZBMainViewController.h"
#define logoBorder 30
@interface XZBLoginViewController ()
@property(nonatomic,weak)UIView *topView;
@property(nonatomic,weak)XZBLoginBotton *bottonView;
@property(nonatomic,weak)UIImageView *logo;
@end

@implementation XZBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *topView = [[UIView alloc] init];
    CGFloat topViewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat topViewH = 200;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    topView.frame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"大圈主"];
    CGFloat logoW = 102;
    CGFloat logoH = 90;
    CGFloat logoX = ([UIScreen mainScreen].bounds.size.width - logoW)/2;
    CGFloat logoY = topViewH - logoH - logoBorder;
    logo.frame = CGRectMake(logoX, logoY, logoW, logoH);
    [topView addSubview:logo];
    self.logo = logo;
    [self.view addSubview:topView];
    self.topView = topView;
    self.topView.backgroundColor = [UIColor whiteColor];
    
    XZBLoginBotton *bottonView = [[XZBLoginBotton alloc] init];
    CGFloat bottonViewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat bottonViewH = [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(topView.frame);
    CGFloat bottonViewX = 0;
    CGFloat bottonViewY = CGRectGetMaxY(topView.frame);
    bottonView.frame = CGRectMake(bottonViewX, bottonViewY, bottonViewW, bottonViewH);
    [bottonView.choseStudent.checkBox addTarget:self action:@selector(selectStatusType) forControlEvents:UIControlEventTouchUpInside];
    bottonView.choseStudent.checkBox.selected = YES;
    [bottonView.choseTeacher.checkBox addTarget:self action:@selector(selectStatusType) forControlEvents:UIControlEventTouchUpInside];
    bottonView.choseTeacher.checkBox.selected = NO;
    [bottonView.registerBtn addTarget:self action:@selector(toRegisterView) forControlEvents:UIControlEventTouchUpInside];
    [bottonView.resetAccountBtn addTarget:self action:@selector(toResetAccountView) forControlEvents:UIControlEventTouchUpInside];
    [bottonView.loginBtn addTarget:self action:@selector(toMainView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottonView];
    self.bottonView = bottonView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) selectStatusType
{
    self.bottonView.choseTeacher.checkBox.selected = !self.bottonView.choseTeacher.checkBox.selected;
    self.bottonView.choseStudent.checkBox.selected = !self.bottonView.choseStudent.checkBox.selected;
}
- (void) toRegisterView
{
    XZBRegisterViewController *registerView= [[XZBRegisterViewController alloc] init];
    [self presentViewController:registerView animated:YES completion:nil];
}
- (void) toResetAccountView
{
    XZBResetAccountViewController *resetAccountView= [[XZBResetAccountViewController alloc] init];
    [self presentViewController:resetAccountView animated:YES completion:nil];
}
- (void) toMainView
{
    XZBMainViewController *mainView= [[XZBMainViewController alloc] init];
    [self presentViewController:mainView animated:YES completion:nil];
}
@end
