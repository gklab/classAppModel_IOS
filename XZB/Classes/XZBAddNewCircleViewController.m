//
//  XZBAddNewCircleViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/9/2.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAddNewCircleViewController.h"

@interface XZBAddNewCircleViewController ()

@end

@implementation XZBAddNewCircleViewController
-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0, 3, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"搜索圈子";
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] init];
    UIImage *img = [UIImage imageNamed:@"大圈主"];
    rightBarButtonItem.image = [self OriginImage:img scaleToSize:CGSizeMake(25, 25)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
