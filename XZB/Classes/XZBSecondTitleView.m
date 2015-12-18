//
//  XZBSecondTitleView.m
//  XZB
//
//  Created by 王兆凯 on 15/9/1.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBSecondTitleView.h"
#define vBorder 15
#define vMinBorder 6
#define lineH 20;
@interface XZBSecondTitleView()
@property (nonatomic,weak) UIImageView *imgView;
@property (nonatomic,weak) UIButton *friendCircle;
@property (nonatomic,weak) UILabel *lineLabel;
@property (nonatomic,weak) UIButton *techCircle;
@end
@implementation XZBSecondTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    return [self sizeWithText:text font:font maxW:MAXFLOAT];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"大圈主"];
    CGFloat imagViewW = 30;
    CGFloat imagViewH = 30;
    CGFloat imagViewX = vBorder;
    CGFloat imagViewY = (frame.size.height - imagViewH)/2;
    imgView.frame = CGRectMake(imagViewX, imagViewY, imagViewW, imagViewH);
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UIButton *friendCircle = [[UIButton alloc] init];
    NSString *friendCircleTitle = @"校友圈";
    [friendCircle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [friendCircle setTitle:friendCircleTitle forState:UIControlStateNormal];
    friendCircle.titleLabel.font = XZBAddTitleFont;
    CGSize friendCircleSize = [self sizeWithText:friendCircleTitle font:XZBAddTitleFont];
    CGFloat friendCircleX = CGRectGetMaxX(imgView.frame) + vMinBorder;
    CGFloat friendCircleY = (frame.size.height - friendCircleSize.height)/2;
    friendCircle.frame = CGRectMake(friendCircleX, friendCircleY, friendCircleSize.width, friendCircleSize.height);
    [self addSubview:friendCircle];
    self.friendCircle = friendCircle;
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    CGFloat lineLabelW = 1;
    CGFloat lineLabelH = lineH;
    CGFloat lineLabelX = CGRectGetMaxX(friendCircle.frame) + vBorder;
    CGFloat lineLabelY = (frame.size.height - lineLabelH)/2;
    lineLabel.frame = CGRectMake(lineLabelX, lineLabelY, lineLabelW, lineLabelH);
    [self addSubview:lineLabel];
    self.lineLabel = lineLabel;
    
    UIButton *techCircle = [[UIButton alloc] init];
    NSString *techCircleTitle = @"专业圈";
    [techCircle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [techCircle setTitle:techCircleTitle forState:UIControlStateNormal];
    techCircle.titleLabel.font = XZBAddTitleFont;
    CGSize techCircleSize = [self sizeWithText:techCircleTitle font:XZBAddTitleFont];
    CGFloat techCircleX = CGRectGetMaxX(lineLabel.frame) + vBorder;
    CGFloat techCircleY = (frame.size.height - techCircleSize.height)/2;
    techCircle.frame = CGRectMake(techCircleX, techCircleY, techCircleSize.width, techCircleSize.height);
    [self addSubview:techCircle];
    self.techCircle = techCircle;
    
    return self;
}
@end
