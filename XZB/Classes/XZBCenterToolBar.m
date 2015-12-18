//
//  XZBCenterToolBar.m
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBCenterToolBar.h"
#define linWidth 1
#define linHeight 18
@implementation XZBCenterToolBar

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
- (void)setBtnTitleName:(NSString *)name haveLine:(BOOL)line
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:name forState:UIControlStateNormal];
    [self addSubview:btn];
    if(line == YES)
    {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        [self addSubview:label];
    }
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self setBtnTitleName:@"说说" haveLine : YES];
    [self setBtnTitleName:@"服务" haveLine : YES];
    [self setBtnTitleName:@"公开课" haveLine : NO];
    return self;
}
-(void)layoutSubviews
{
    NSUInteger count = self.subviews.count;
    CGFloat btnW = self.frame.size.width/3 - count / 2 * linWidth;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    for(int i=0;i<count;i++)
    {
        CGFloat btnX = (i+1) / 2 * btnW;
        if(i % 2 == 0)
        {
            [self.subviews[i] setFrame:CGRectMake(btnX + linWidth * (i / 2), btnY, btnW, btnH)];
            
        }
        else
        {
            [self.subviews[i] setFrame:CGRectMake(btnX + linWidth * ((i+1) / 2), (btnH - linHeight) / 2, linWidth, linHeight)];
        }
    }
}
@end
