//
//  XZBBaseCellFrame.m
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBBaseCellFrame.h"
#import "XZBBaseCellInfo.h"
#define cellH 40
#define cellBorder 10
#define CellMargin 20;
@implementation XZBBaseCellFrame
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
-(void)myBaseCellInfos
{
    if(!_baseCellBtnsf)
    {
        _baseCellBtnsf = [[NSMutableArray alloc] init];
    }
    NSUInteger count = self.baseCellInfos.count;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat baseX = 0;
    CGFloat baseY = 0;
    CGFloat baseW = cellW;
    CGFloat baseH = cellH;
    for(int i=0; i<count; i++)
    {
        CGRect rect=CGRectMake(baseX, baseY, baseW, baseH);
        NSValue *originalRectValue = [NSValue valueWithCGRect:rect];
        [self.baseCellBtnsf addObject:originalRectValue];
        baseY = baseY + cellH;
    }
    CGFloat iconX = cellBorder;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconY = (cellH - iconH)/2;
    self.iconImageViewf = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGSize titleSize = [self sizeWithText:@"标题最多能显示十个字" font:XZBBaseCellMaxFont];
    CGFloat titleX = CGRectGetMaxX(self.iconImageViewf) + cellBorder;
    CGFloat titleY = (cellH - titleSize.height)/2;
    self.titleLablef = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
    
    CGFloat rightIconW = 20;
    CGFloat rightIconH = 20;
    CGFloat rightIconX = cellW - cellBorder - rightIconW;
    CGFloat rightIconY = (cellH - rightIconH)/2;
    self.rightIcon = CGRectMake(rightIconX, rightIconY, rightIconW, rightIconH);
    
    CGFloat baseViewX = 0;
    CGFloat baseViewY = CellMargin;
    CGFloat baseViewW = cellW;
    CGFloat baseViewH = baseY;
    self.baseViewf = CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH);
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}
- (void)setInfoIcon:(NSString *)icon_url title:(NSString *)title
{
    if(!_baseCellInfos)
    {
        _baseCellInfos = [[NSMutableArray alloc] init];
    }
    XZBBaseCellInfo *cellInfo = [[XZBBaseCellInfo alloc] init];
    cellInfo.icon_url = icon_url;
    cellInfo.title = title;
    [self.baseCellInfos addObject:cellInfo];
    
}
@end
