//
//  XZBCenterViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/7/6.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBCenterViewController.h"
#import "XZBBaseCell.h"
#import "XZBMyInfoCell.h"
#import "XZBMyInfoFrame.h"
@interface XZBCenterViewController ()
@property (nonatomic, strong) NSMutableArray *centerFrames;
@end

@implementation XZBCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.separatorStyle = NO;
    self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.0];
//    XZBMyInfoView *myInfo= [[XZBMyInfoView alloc] init];
//    myInfo.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, 100);
//    [self.view addSubview:myInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.centerFrames.count;
}


-(NSMutableArray *)centerFrames
{
    if(!_centerFrames)
    {
        self.centerFrames = [[NSMutableArray alloc] init];
        //测试数据
        XZBUser *user = [[XZBUser alloc] init];
        XZBMyInfoFrame *myInfoFrame = [[XZBMyInfoFrame alloc] init];
        user.name = @"守望麦田";
        user.face_image_url = @"face2";
        user.city = @"北京";
        user.school = @"北京大学";
        user.institute = @"计算机信息工程与自动化系";
        user.status = @"老师";
        user.fansNum = 112;
        user.attentionNum = 34;
        myInfoFrame.user = user;
        [self.centerFrames addObject:myInfoFrame];
        
        //测试数据 end
        XZBBaseCellFrame *baseCellFrame1 = [[XZBBaseCellFrame alloc] init];
        [baseCellFrame1 setInfoIcon:@"face" title:@"系统消息"];
        [baseCellFrame1 setInfoIcon:@"face" title:@"我的账户"];
        [baseCellFrame1 setInfoIcon:@"face" title:@"我的推广和金币"];
        [self.centerFrames addObject:baseCellFrame1];
        [baseCellFrame1 myBaseCellInfos];
        
        XZBBaseCellFrame *baseCellFrame2 = [[XZBBaseCellFrame alloc] init];
        [baseCellFrame2 setInfoIcon:@"face" title:@"我的收藏"];
        //[baseCellFrame2 setInfoIcon:@"face" title:@"222"];
        [self.centerFrames addObject:baseCellFrame2];
        [baseCellFrame2 myBaseCellInfos];
        
        XZBBaseCellFrame *baseCellFrame3 = [[XZBBaseCellFrame alloc] init];
        [baseCellFrame3 setInfoIcon:@"face" title:@"设置"];
        //[baseCellFrame2 setInfoIcon:@"face" title:@"222"];
        [self.centerFrames addObject:baseCellFrame3];
        [baseCellFrame3 myBaseCellInfos];
    }
    return _centerFrames;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        XZBMyInfoCell *myInfoCell = [XZBMyInfoCell initWithTableView:tableView];
        myInfoCell.myInfoFrame = self.centerFrames[indexPath.row];
        return  myInfoCell;
    }
    else
    {
        XZBBaseCellFrame *baseCellFrame = self.centerFrames[indexPath.row];
        XZBBaseCell *baCell = [XZBBaseCell initWithTableView:tableView btnNum:baseCellFrame.baseCellInfos.count];
        baCell.baseCellFrame = baseCellFrame;
        return  baCell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath == 0)
    {
        XZBMyInfoFrame *frame = self.centerFrames[indexPath.row];
        return frame.cellHeight;
    }
    else
    {
        XZBBaseCellFrame *frame = self.centerFrames[indexPath.row];
        return frame.cellHeight;
    }
}

@end
