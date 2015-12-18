//
//  XZBMessageFrame.m
//  XZB
//
//  Created by 王兆凯 on 15/8/30.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBMessageFrame.h"
#define cellBtnH 60
#define cellBorder 10
#define cellMargin 20
@implementation XZBMessageFrame
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
-(void)toSetMessageCell1IsTop:(BOOL)isTop
{
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat iconViewW = 30;
    CGFloat iconViewH = 30;
    CGFloat iconViewX = cellBorder;
    CGFloat iconViewY = (cellBtnH-iconViewH)/2;
    self.iconViewf = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    CGFloat titleLableX = CGRectGetMaxX(self.iconViewf)+cellBorder;
    CGFloat titleLableY = iconViewY;
    CGSize titleLableSize = [self sizeWithText:self.message.title font:XZBMessageCellNameFont];
    self.titleLablef = CGRectMake(titleLableX, titleLableY, titleLableSize.width, iconViewH);
    
    CGFloat baseViewY = 0;
    CGFloat baseViewX = 0;
    if(isTop)
    {
        baseViewY = cellMargin;
    }
    CGFloat baseViewH = cellBtnH;
    CGFloat baseViewW = cellW;
    self.baseViewf = CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH);
    
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}
-(void)toSetMessageCell2IsTop:(BOOL)isTop
{
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat faceViewW = 30;
    CGFloat faceViewH = 30;
    CGFloat faceViewX = cellBorder;
    CGFloat faceViewY = (cellBtnH-faceViewH)/2;
    self.faceViewf = CGRectMake(faceViewX, faceViewY, faceViewW, faceViewH);
    
    CGFloat nameLableX = CGRectGetMaxX(self.faceViewf)+cellBorder;
    CGFloat nameLableY = faceViewY;
    CGSize nameLableSize = [self sizeWithText:self.message.user.name font:XZBMessageCellNameFont];
    self.nameLablef = CGRectMake(nameLableX, nameLableY, nameLableSize.width, nameLableSize.height);
    
    CGFloat contentLableX = CGRectGetMaxX(self.faceViewf)+cellBorder;
    CGFloat contentLableY = CGRectGetMaxY(self.nameLablef)+cellBorder;
    CGSize contentLableSize = [self sizeWithText:self.message.content font:XZBMessageCellContentFont];
    self.contentLablef = CGRectMake(contentLableX, contentLableY, contentLableSize.width, contentLableSize.height);
    
    CGSize timeLableSize = [self sizeWithText:self.message.time font:XZBMessageCellTimeFont];
    CGFloat timeLableX = cellW-timeLableSize.width-cellBorder;
    CGFloat timeLableY = (cellBtnH - timeLableSize.height)/2;
    self.timeLablef = CGRectMake(timeLableX, timeLableY, timeLableSize.width, timeLableSize.height);
    CGFloat baseViewY = 0;
    if(isTop)
    {
        baseViewY = cellMargin;
    }
    CGFloat baseViewX = 0;
    CGFloat baseViewH = cellBtnH;
    CGFloat baseViewW = cellW;
    self.baseViewf = CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH);
    
    
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}
@end
