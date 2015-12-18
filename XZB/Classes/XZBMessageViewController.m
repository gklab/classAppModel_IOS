//
//  XZBMessageViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/7/6.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBMessageViewController.h"
#import "XZBWhisperViewController.h"
#import "XZBMessageCell.h"
#import "XZBUser.h"
#define cellMargin 20
@interface XZBMessageViewController ()
@property (nonatomic, strong) NSMutableArray *messageFrames;
@end

@implementation XZBMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = NO;
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:246.0/255 alpha:1];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStyleDone target:self action:@selector(selectMes)];
    // Do any additional setup after loading the view.
}
-(void)selectMes
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.1
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrames.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBMessageCell *meCell = [XZBMessageCell initWithTableView:tableView];
    meCell.messageFrame = self.messageFrames[indexPath.row];
    return  meCell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBWhisperViewController *whisperVc = [[XZBWhisperViewController alloc] init];
    whisperVc.navigationItem.title = @"悄悄话";
    whisperVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:whisperVc animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBMessageFrame *frame = self.messageFrames[indexPath.row];
    return frame.cellHeight;
}

- (NSMutableArray *)messageFrames
{
    if (!_messageFrames) {
        self.messageFrames = [NSMutableArray array];
        XZBMessage *whisper = [[XZBMessage alloc] init];
        XZBMessage *presuade= [[XZBMessage alloc] init];
        XZBMessageFrame *whisperFrame = [[XZBMessageFrame alloc] init];
        XZBMessageFrame *presuadeFrame = [[XZBMessageFrame alloc] init];
        whisper.title = @"悄悄话";
        whisper.iconUrl = @"悄悄话标志";
        whisperFrame.message = whisper;
        whisperFrame.cellType = 1;
        [whisperFrame toSetMessageCell1IsTop:YES];
        [self.messageFrames addObject:whisperFrame];
        
        presuade.title = @"说说消息";
        presuade.iconUrl = @"message_whisper_icon";
        presuadeFrame.message = presuade;
        presuadeFrame.cellType = 1;
        [presuadeFrame toSetMessageCell1IsTop:NO];
        [self.messageFrames addObject:presuadeFrame];
        
        //测试数据
        XZBMessage *mes1 = [[XZBMessage alloc] init];
        XZBMessage *mes2 = [[XZBMessage alloc] init];
        XZBMessageFrame *mes1presuadeFrame = [[XZBMessageFrame alloc] init];
        XZBMessageFrame *mes2presuadeFrame = [[XZBMessageFrame alloc] init];
        XZBUser *user = [[XZBUser alloc] init];
        user.name = @"小李";
        user.face_image_url = @"大圈主";
        mes1.user = user;
        mes1.content = @"新消息~新消息~";
        mes1.time = @"2015年2月31日";
        mes2 = mes1;
        mes1presuadeFrame.message = mes1;
        mes2presuadeFrame.message = mes2;
        mes1presuadeFrame.cellType = 2;
        mes2presuadeFrame.cellType = 2;
        [mes1presuadeFrame toSetMessageCell2IsTop:YES];
        [mes2presuadeFrame toSetMessageCell2IsTop:NO];
        [self.messageFrames addObject:mes1presuadeFrame];
        [self.messageFrames addObject:mes2presuadeFrame];
        [self.messageFrames addObject:mes2presuadeFrame];
        [self.messageFrames addObject:mes2presuadeFrame];

    }
    return _messageFrames;
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
