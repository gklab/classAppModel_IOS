//
//  XZBDropdownMenu.m
//  XZB
//
//  Created by 王兆凯 on 15/8/7.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBDropdownMenu.h"
@interface XZBDropdownMenu()
@property (nonatomic,weak) UIImageView *contentView;
@end
@implementation XZBDropdownMenu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        //添加图标背景s
        UIImageView *contentView = [[UIImageView alloc] init];
        contentView.userInteractionEnabled = YES;
        contentView.image = [UIImage imageNamed:@"popover__right"];
        //CGRect wframe = contentView.frame;
        //wframe.origin.x = 273;
        //wframe.origin.y = 63;
        //wframe.size.width = 100;
        //wframe.size.height = 160;
        //contentView.frame = wframe;
        [self addSubview:contentView];
        self.contentView = contentView;
    }
    return self;
}
+ (instancetype) menu
{
    return [[self alloc] init];
}
- (void) show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //CGRect newframe= [btn.superview convertRect:btn.frame toView:window];
    CGRect wframe = self.contentView.frame;
    wframe.origin.y = 64;
    wframe.origin.x = window.frame.size.width - self.contentView.frame.size.width;
    self.contentView.frame = wframe;
    
    self.frame = window.bounds;
    [window addSubview:self];
}
- (void) dismiss
{
    [self removeFromSuperview];
}
- (void)setContent:(UIImageView *)content
{
    int widthMore = 20;
    int heighMore = 30;
    CGRect wframe = self.contentView.frame;
    wframe.size.width = content.frame.size.width+widthMore;
    wframe.size.height = content.frame.size.height+heighMore;
    self.contentView.frame = wframe;
    
    wframe = content.frame;
    wframe.origin.x= widthMore/2;
    wframe.origin.y= heighMore/2;
    content.frame = wframe;
    _content = content;
    [self.contentView addSubview:content];
}
-(void) setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    self.content = contentController.view;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}
@end


//UIWindow *window = [UIApplication sharedApplication].keyWindow;
////添加蒙板
//UIView * cover=[[UIView alloc] init];
//cover.backgroundColor = [UIColor clearColor];
//cover.frame =window.bounds;
//[window addSubview:cover];
////添加更多图标
//UIImageView *dropDownMore = [[UIImageView alloc] init];
//dropDownMore.userInteractionEnabled = YES;
//dropDownMore.image = [UIImage imageNamed:@"popover__right"];
//CGRect wframe = dropDownMore.frame;
//wframe.origin.x = 273;
//wframe.origin.y = 63;
//wframe.size.width = 100;
//wframe.size.height = 160;
//dropDownMore.frame = wframe;
////添加更多图标的按钮
//[dropDownMore addSubview:[UIButton buttonWithType:UIButtonTypeContactAdd]];
//
//
//[window addSubview:dropDownMore];
