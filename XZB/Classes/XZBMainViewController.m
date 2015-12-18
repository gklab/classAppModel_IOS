//
//  XZBMainViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/7/6.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBMainViewController.h"
#import "XZBCircleViewController.h"
#import "XZBCenterViewController.h"
#import "XZBAnswerViewController.h"
#import "XZBMessageViewController.h"
#import "XZBAddViewController.h"
#import "XZBTabBar.h"
@interface XZBMainViewController ()<XZBTabBarDelegate>

@end

@implementation XZBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Do any additional setup after loading the view.
    XZBMessageViewController *messageVc = [[XZBMessageViewController alloc] init];
    [self addChildController:messageVc image:@"message" selectImage:@"message_on" title:@"消息"];

    XZBAnswerViewController *answerVc = [[XZBAnswerViewController alloc] init];
    [self addChildController:answerVc image:@"interact" selectImage:@"interact_on" title:@"互动"];
    
    XZBCircleViewController *circleVc = [[XZBCircleViewController alloc] init];
    [self addChildController:circleVc image:@"circle" selectImage:@"circle_on" title:@"圈子"];

    XZBCenterViewController *centerVc = [[XZBCenterViewController alloc] init];
    [self addChildController:centerVc image:@"我" selectImage:@"me_on" title:@"我"];
    //self.tabBar.backgroundColor = [UIColor redColor];
    XZBTabBar *tabBar = [[XZBTabBar alloc] init];
    tabBar._delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 3, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
-(void) addChildController:(UIViewController *)childVc image:(NSString *)image selectImage:(NSString *)selectImage title:(NSString *)title
{
    UIImage *vcImage = [UIImage imageNamed:image];
    UIImage *vcSelectImage = [UIImage imageNamed:selectImage];
    CGSize cs;
    cs.height = vcImage.size.width/2;
    cs.width = vcImage.size.height/2;
    childVc.navigationItem.title=title;
    childVc.tabBarItem.image =[[self OriginImage:vcImage scaleToSize:cs] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[self OriginImage:vcSelectImage scaleToSize:cs] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tabBarDidClickPlusButton:(XZBTabBar *)tabBar
{
    XZBAddViewController *addVc = [[XZBAddViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:addVc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
