//
//  XZBLoginHeadViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/9/4.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBLoginHeadViewController.h"
#import "XZBLoginHeadMid.h"
#import "XZBLoginHeadBotton.h"
#import "XZBLoginViewController.h"
#import "XZBRegisterViewController.h"
#define logoBorder 30
@interface XZBLoginHeadViewController ()
@property(nonatomic,weak)UIView *topView;
@property(nonatomic,weak)UIImageView *logo;
@property(nonatomic,weak)XZBLoginHeadMid *midView;
@property(nonatomic,weak)XZBLoginHeadBotton *bottonView;
@end

@implementation XZBLoginHeadViewController

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
    
    XZBLoginHeadMid *midView = [[XZBLoginHeadMid alloc] init];
    CGFloat midViewX = 0;
    CGFloat midViewY = CGRectGetMaxY(self.topView.frame);
    CGFloat midViewW = topViewW;
    CGFloat midViewH = loginHeadMidH;
    midView.frame = CGRectMake(midViewX, midViewY, midViewW, midViewH);
    [self.view addSubview:midView];
    self.midView = midView;
    [self.midView.loginBtn addTarget:self action:@selector(toLoginView) forControlEvents:UIControlEventTouchUpInside];
    [self.midView.registerBtn addTarget:self action:@selector(toRegisterView) forControlEvents:UIControlEventTouchUpInside];
    
    XZBLoginHeadBotton *bottonView = [[XZBLoginHeadBotton alloc] init];
    CGFloat bottonViewX = 0;
    CGFloat bottonViewY = CGRectGetMaxY(self.midView.frame);
    CGFloat bottonViewW = midViewW;
    CGFloat bottonViewH = [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(midView.frame);
    bottonView.frame = CGRectMake(bottonViewX, bottonViewY, bottonViewW, bottonViewH);
    [self.view addSubview:bottonView];
    self.bottonView = bottonView;
    
    
    // Do any additional setup after loading the view.
}
- (void)toLoginView
{
    XZBLoginViewController *loginView= [[XZBLoginViewController alloc] init];
    [self presentViewController:loginView animated:YES completion:nil];
}
- (void) toRegisterView
{
    XZBRegisterViewController *registerView= [[XZBRegisterViewController alloc] init];
    [self presentViewController:registerView animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
