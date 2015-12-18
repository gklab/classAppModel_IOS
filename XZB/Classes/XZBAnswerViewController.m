//
//  XZBAnswerViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/7/6.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAnswerViewController.h"
#import "XZBAnswerCell.h"
#import "XZBInfoFrame.h"
#import "XZBUser.h"
#import "XZBPhoto.h"
#import "XZBInfo.h"
#import "XZBPublishInfoViewController.h"
@interface XZBAnswerViewController ()
@property (nonatomic, strong) NSMutableArray *infoFrames;
@end

@implementation XZBAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发说说" style:UIBarButtonItemStyleDone target:self action:@selector(toPublishInfoView)];
    // Do any additional setup after loading the view.
    [self setupRefresh];
    
}
- (void)toPublishInfoView
{
    XZBPublishInfoViewController *publish = [[XZBPublishInfoViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:publish];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (NSMutableArray *)infoFrames
{
    if (!_infoFrames) {
        self.infoFrames = [[NSMutableArray array] init];
        //测试数据
        XZBInfoFrame *infof = [[XZBInfoFrame alloc] init];
        XZBInfoFrame *infof2 = [[XZBInfoFrame alloc] init];
        XZBInfoFrame *infof3 = [[XZBInfoFrame alloc] init];
        XZBInfoFrame *infof4 = [[XZBInfoFrame alloc] init];
        XZBInfo *info = [[XZBInfo alloc] init];
        XZBInfo *info2 = [[XZBInfo alloc] init];
        XZBUser *user = [[XZBUser alloc] init];
        info.user = user;
        info.user.name = @"李li";
        info.user.face_image_url = @"大圈主";
        info.user.school = @"清华大学";
        info.user.institute = @"信息工程与自动化系";
        info.content = @"[死鱼原因正在核实调查]天津市环境监测中心主任邓小文回应：关于死鱼的事，我刚进会场的时候通过微博发现这个信息，死鱼的事情原因很多，我们已经派人去现场核查死鱼地点，下一步马上要和渔业水产部门对水质死鱼本身进行监测和检查，进一步核实死鱼的原因，一有结果马上向媒体通报。";
        info.created_at = @"2015年2月31日";
        infof.info = info;
        
        XZBPhoto *photo = [[XZBPhoto alloc] init];
        photo.url = @"大圈主";
        info2.user = info.user;
        info2.user.name = info.user.name;
        info2.user.face_image_url = info.user.face_image_url;
        info2.user.school = info.user.school;
        info2.user.institute = info.user.institute;
        info2.content = info.content;
        info2.created_at = info.created_at;
        info2.photos = [NSArray arrayWithObjects:photo, nil];
        infof2.info = info2;
        
        info.photos = nil;
        XZBInfo *forwardInfo = [[XZBInfo alloc] init];
        forwardInfo.user = [[XZBUser alloc] init];
        forwardInfo.user.name = @"刘某";
        forwardInfo.content = @"要和渔业水产部门对水质死鱼本身进行监测和检查，进一步核实死鱼的原因，一有结果马上向媒体通报。要和渔业水产部门对水质死鱼本身进行监测和检查，进一步核实死鱼的原因，一有结果马上向媒体通报。";
        info.forwardInfo = forwardInfo;
        infof3.info = info;
        
        info.forwardInfo.photos = [NSArray arrayWithObjects:photo, nil];
        infof4.info = info;
        
        [self.infoFrames addObject:infof];
        [self.infoFrames addObject:infof2];
        [self.infoFrames addObject:infof3];
        [self.infoFrames addObject:infof4];
        
        //测试数据 end
    }
    return _infoFrames;
}
-(void) setupRefresh
{
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(refreshValChange:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)refreshValChange:(UIRefreshControl *)refresh
{
    sleep(2);
    [refresh endRefreshing];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.backgroundColor = [UIColor orangeColor];
    CGRect wframe = lable.frame;
    wframe.size.width = [UIScreen mainScreen].bounds.size.width;
    wframe.size.height = 35;
    wframe.origin.y = 64 - wframe.size.height;
    lable.frame = wframe;
    lable.text = @"没有新消息";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:16];
    
    [self.navigationController.view insertSubview:lable belowSubview:self.navigationController.navigationBar];
    CGFloat duration = 1.0;
    [UIView animateWithDuration:duration animations:^{
        CGRect wframe = lable.frame;
        wframe.origin.y = wframe.origin.y + wframe.size.height;
        lable.frame = wframe;
    }completion:^(BOOL finished){
        CGFloat delay = 1.0;
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
            CGRect wframe = lable.frame;
            wframe.origin.y = wframe.origin.y - wframe.size.height;
            lable.frame = wframe;
        } completion:^(BOOL finished) {
            [lable removeFromSuperview];
        }];
    }];
    
    
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infoFrames.count;
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
    XZBAnswerCell *anCell = [XZBAnswerCell initWithTableView:tableView];
    anCell.infoFrame = self.infoFrames[indexPath.row];
    //anCell.textLabel.text = [NSString stringWithFormat:@"用户%ld",indexPath.row];
    //anCell.detailTextLabel.text = [NSString stringWithFormat:@"第%ld条信息",indexPath.row];
    //[anCell.imageView setImage:[UIImage imageNamed:@"大圈主"]];
    return  anCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZBInfoFrame *frame = self.infoFrames[indexPath.row];
    return frame.cellHeight;
}
@end
