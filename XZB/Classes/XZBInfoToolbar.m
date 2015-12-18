//
//  XZBInfoToolbar.m
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBInfoToolbar.h"
//@interface XZBInfoToolbar()
//@property (nonatomic,weak) UIButton *forwardButton;
//@property (nonatomic,weak) UIButton *commentButton;
//@property (nonatomic,weak) UIButton *likeButton;
//@end
@implementation XZBInfoToolbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)toolbar
{
    return [[self alloc] init];
}
- (void)setBtnImagName:(NSString *)name
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [self addSubview:btn];
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"info_toolbar_background"]];
    [self setBtnImagName:@"info_forward"];
    [self setBtnImagName:@"info_comment"];
    [self setBtnImagName:@"info_unlike"];
    
    return self;
}
-(void)layoutSubviews
{
    CGFloat btnW = self.frame.size.width/3;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    NSUInteger count = self.subviews.count;
    for(int i=0;i<count;i++)
    {
        CGFloat btnX = i * btnW;
        [self.subviews[i] setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    }
}
@end
