//
//  XZBAddViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/9/1.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAddViewController.h"
#import "XZBSecondTitleView.h"
#import "XZBAddTableViewController.h"
#import "XZBAddNewCircleViewController.h"
#define secondTitleH 50
@interface XZBAddViewController ()
@property(nonatomic,weak)XZBSecondTitleView *secTitleView;
@property(nonatomic,weak)XZBAddTableViewController *addTableViewController;
@end

@implementation XZBAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:246.0/255 alpha:1];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+添加圈子" style:UIBarButtonItemStyleDone target:self action:@selector(addCircle)];
    NSDictionary *whiteDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    NSDictionary *orangDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:228.0/255 green:72.0/255 blue:22.0/255 alpha:1], NSForegroundColorAttributeName, nil];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:whiteDic forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:orangDic forState:UIControlStateNormal];
    [self.navigationController.navigationBar setTitleTextAttributes:whiteDic];
    self.navigationItem.title = @"管理圈子";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:49.0/255 green:62.0/255 blue:78.0/255 alpha:1]];
    
    XZBSecondTitleView *secTitleView = [[XZBSecondTitleView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.navigationController.navigationBar.frame) + [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.frame.size.width, secondTitleH)];
    [self.view addSubview:secTitleView];
    self.secTitleView = secTitleView;
    
    XZBAddTableViewController *addTableViewController = [[XZBAddTableViewController alloc] init];
    addTableViewController.view.frame = CGRectMake(0, CGRectGetMaxY(secTitleView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(secTitleView.frame));
    [self.view addSubview:addTableViewController.view];
    [self addChildViewController:addTableViewController];
    self.addTableViewController = addTableViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)addCircle
{
    XZBAddNewCircleViewController *addNewCircle = [[XZBAddNewCircleViewController alloc] init];
    [self.navigationController pushViewController:addNewCircle animated:YES];
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
