//
//  XZBWhisperViewController.m
//  XZB
//
//  Created by 王兆凯 on 15/7/28.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBWhisperViewController.h"
#import "XZBDropdownMenu.h"
#import "XZBMenuViewController.h"
@interface XZBWhisperViewController ()

@end

@implementation XZBWhisperViewController

- (void)viewDidLoad {
    UISearchBar *searchBar =[[UISearchBar alloc] init];
    //searchBar.scopeBarBackgroundImage = [UIImage imageNamed:<#(NSString *)#>]
    self.navigationItem.titleView = searchBar;
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStyleDone target:self action:@selector(more)];
}
-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)more
{
    XZBDropdownMenu *menu = [XZBDropdownMenu menu];
    XZBMenuViewController *menuTable = [[XZBMenuViewController alloc] init];
    CGRect wframe = menuTable.view.frame;
    wframe.size.width = 66;
    wframe.size.height = 44*3;
    menuTable.view.frame = wframe;
    menu.contentController = menuTable;
    //menu.content = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, 140)];
    [menu show];
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
