//
//  XZBResetAccountViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBResetAccountViewController.h"
#import "XZBResetAccountBotton.h"
#import "XZBLoginViewController.h"
#define logoBorder 30
@interface XZBResetAccountViewController ()
@property(nonatomic,weak)UIView *topView;
@property(nonatomic,weak)UIImageView *logo;
@property(nonatomic,weak)XZBResetAccountBotton *bottonView;
@end

@implementation XZBResetAccountViewController

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
    
    XZBResetAccountBotton *bottonView = [[XZBResetAccountBotton alloc] init];
    CGFloat bottonViewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat bottonViewH = [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(topView.frame);
    CGFloat bottonViewX = 0;
    CGFloat bottonViewY = CGRectGetMaxY(topView.frame);
    bottonView.frame = CGRectMake(bottonViewX, bottonViewY, bottonViewW, bottonViewH);
    [bottonView.okBtn addTarget:self action:@selector(toLoginView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottonView];
    self.bottonView = bottonView;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) toLoginView
{
    XZBLoginViewController *loginView= [[XZBLoginViewController alloc] init];
    [self presentViewController:loginView animated:YES completion:nil];
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
