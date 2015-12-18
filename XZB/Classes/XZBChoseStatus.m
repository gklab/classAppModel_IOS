//
//  XZBChoseStatus.m
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBChoseStatus.h"
#define viewBorder 15
#define minViewBorder 7
#define XZBTitleFont [UIFont fontWithName:nil size:15]
@interface XZBChoseStatus()
@property(nonatomic,weak)UIImageView *imgView;
@property(nonatomic,weak)UILabel *checkBoxTitle;
@property(nonatomic,weak)UILabel *tipTitle;

@end
@implementation XZBChoseStatus

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
- (void)initWithImgName:(NSString *)imgName ChoseTitle:(NSString *)choseTitleName TipTitle:(NSString *)tipTitleName
{
    self.backgroundColor = [UIColor clearColor];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:imgName];
    CGFloat imgViewW = 70;
    CGFloat imgViewH = 70;
    CGFloat imgViewX = (self.frame.size.width - imgViewW)/2;
    CGFloat imgViewY = 0;
    imgView.frame = CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH);
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UIButton *checkBox = [[UIButton alloc] init];
    CGFloat checkBoxX = 0;
    CGFloat checkBoxY = CGRectGetMaxY(imgView.frame) + viewBorder;
    CGFloat checkBoxW = 25;
    CGFloat checkBoxH = 25;
    checkBox.frame = CGRectMake(checkBoxX, checkBoxY, checkBoxW, checkBoxH);
    checkBox.backgroundColor = [UIColor redColor];
    [checkBox setBackgroundImage:[UIImage imageNamed:@"no_selected"] forState:UIControlStateNormal];
    [checkBox setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [checkBox setAdjustsImageWhenHighlighted:NO];
    [self addSubview:checkBox];
    self.checkBox = checkBox;
    
    UILabel *checkBoxTitle = [[UILabel alloc] init];
    CGSize checkBoxTitleSize = [self sizeWithText:choseTitleName font:XZBTitleFont];
    CGFloat checkBoxTitleX = CGRectGetMaxX(checkBox.frame) + viewBorder;
    CGFloat checkBoxTitleY = checkBoxY + (checkBoxH - checkBoxTitleSize.height)/2;
    checkBoxTitle.frame = CGRectMake(checkBoxTitleX, checkBoxTitleY, checkBoxTitleSize.width, checkBoxTitleSize.height);
    checkBoxTitle.font = XZBTitleFont;
    checkBoxTitle.text = choseTitleName;
    
    [self addSubview:checkBoxTitle];
    self.checkBoxTitle = checkBoxTitle;
    
    UILabel *tipTitle = [[UILabel alloc] init];
    CGSize tipTitleSize = [self sizeWithText:tipTitleName font:XZBTitleFont];
    CGFloat tipTitleX = checkBoxX;
    CGFloat tipTitleY = MAX(CGRectGetMaxY(checkBox.frame), CGRectGetMaxY(checkBoxTitle.frame)) + minViewBorder;
    tipTitle.frame = CGRectMake(tipTitleX, tipTitleY, tipTitleSize.width, tipTitleSize.height);
    tipTitle.font = XZBTitleFont;
    tipTitle.textColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1];
    tipTitle.text = tipTitleName;
    [self addSubview:tipTitle];
    self.tipTitle = tipTitle;
}

@end
