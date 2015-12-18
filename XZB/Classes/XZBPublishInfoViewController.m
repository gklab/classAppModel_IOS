//
//  XZBPublishInfoViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBPublishInfoViewController.h"
#import "XZBTextView.h"
#import "XZBPublishCell.h"
#define XZBInfoCellMargin 20;
#define publishBtnH 50
@interface XZBPublishInfoViewController ()
@property (nonatomic,weak) XZBTextView *textView;
@property (nonatomic,weak) UIButton * bottomBtn;
@property (nonatomic, strong) NSMutableArray *publishFrames;
@end

@implementation XZBPublishInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = NO;
    self.navigationItem.title = @"发表说说";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    
    
    UIButton * bottomBtn = [[UIButton alloc] init];
    [bottomBtn setTitle:@"发表说说" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1.0] forState:UIControlStateNormal];
    bottomBtn.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    CGRect frame;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    frame.size.height = publishBtnH;
    frame.origin.x = 0;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height-self.navigationController.navigationBar.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height-publishBtnH;
    bottomBtn.frame = frame;
    self.bottomBtn = bottomBtn;
    [self.view addSubview:self.bottomBtn];
}
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)publishInfo
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSMutableArray *)publishFrames
{
    if (!_publishFrames)
    {
        self.publishFrames = [[NSMutableArray array] init];
        XZBPublishFrame *publish1 = [[XZBPublishFrame alloc] init];
        XZBPublishFrame *publish2 = [[XZBPublishFrame alloc] init];
        XZBPublishFrame *publish3 = [[XZBPublishFrame alloc] init];
        
        publish1.cellType = 1;
        [publish1 toSetPublishCell1];
        publish2.cellType = 2;
        [publish2 toSetPublishCell2];
        publish3.cellType = 3;
        [publish3 toSetPublishCell3];
        
        [self.publishFrames addObject:publish1];
        [self.publishFrames addObject:publish2];
        [self.publishFrames addObject:publish3];
    }
    return _publishFrames;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBPublishCell *puCell = [XZBPublishCell initWithTableView:tableView];
    puCell.publishFrame = self.publishFrames[indexPath.row];
    return  puCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBPublishFrame *frame = self.publishFrames[indexPath.row];
    return frame.cellHeight;
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
