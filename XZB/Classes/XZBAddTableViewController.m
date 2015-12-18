//
//  XZBAddViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/7/28.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAddTableViewController.h"
#import "XZBAddCell.h"
#import "XZBAddCellFrame.h"
#import "XZBSelectCircle.h"
@interface XZBAddTableViewController ()
@property (nonatomic, strong) NSMutableArray *addFrames;
@property (nonatomic, strong) XZBAddCell *selectedCell;
@property (nonatomic, strong) UIActionSheet *sheet;
@end

@implementation XZBAddTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:246.0/255 alpha:1];
    self.tableView.separatorStyle = NO;
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addFrames.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBAddCell *adCell = [XZBAddCell initWithTableView:tableView];
    adCell.addCellFrame = self.addFrames[indexPath.row];
    return  adCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBAddCellFrame *frame = self.addFrames[indexPath.row];
    return frame.cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedCell = (XZBAddCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    self.selectedCell.rightImageView.hidden = NO;
    
    NSString *sheetTitle = [NSString stringWithFormat:@"%@ %@ %@",self.selectedCell.addCellFrame.selectCircle.city,self.selectedCell.addCellFrame.selectCircle.school,self.selectedCell.addCellFrame.selectCircle.institute];
    self.sheet = [[UIActionSheet alloc] initWithTitle:sheetTitle
                                        delegate:self
                               cancelButtonTitle:@"取消"
                          destructiveButtonTitle:nil
                               otherButtonTitles:@"进入圈子", @"访问官网", @"进入广场", @"删除圈子", nil];
    [self.sheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.selectedCell.rightImageView.hidden = YES;
}
- (NSMutableArray *)addFrames
{
    if (!_addFrames)
    {
        self.addFrames = [[NSMutableArray array] init];
        //测试数据
        XZBSelectCircle *sc1 = [[XZBSelectCircle alloc] init];
        XZBSelectCircle *sc2 = [[XZBSelectCircle alloc] init];
        XZBSelectCircle *sc3 = [[XZBSelectCircle alloc] init];
        XZBAddCellFrame *scFrame1 = [[XZBAddCellFrame alloc] init];
        XZBAddCellFrame *scFrame2 = [[XZBAddCellFrame alloc] init];
        XZBAddCellFrame *scFrame3 = [[XZBAddCellFrame alloc] init];
        sc1.city = @"北京";
        sc1.school = @"清华大学";
        sc1.institute = @"软件工程学院";
        sc2.city = @"北京";
        sc2.school = @"北京大学";
        sc2.institute = @"信息工程与自动化学院";
        sc3.city = @"浙江";
        sc3.school = @"浙江大学";
        sc3.institute = @"法学院";
        scFrame1.selectCircle = sc1;
        scFrame2.selectCircle = sc2;
        scFrame3.selectCircle = sc3;
        [self.addFrames addObject:scFrame1];
        [self.addFrames addObject:scFrame2];
        [self.addFrames addObject:scFrame3];
        [self.addFrames addObject:scFrame1];
        [self.addFrames addObject:scFrame2];
        [self.addFrames addObject:scFrame3];
        [self.addFrames addObject:scFrame1];
        [self.addFrames addObject:scFrame2];
        [self.addFrames addObject:scFrame3];
        [self.addFrames addObject:scFrame1];
        [self.addFrames addObject:scFrame2];
        [self.addFrames addObject:scFrame3];
        [self.addFrames addObject:scFrame1];
        [self.addFrames addObject:scFrame2];
        [self.addFrames addObject:scFrame3];
    }
    return _addFrames;
}
@end
