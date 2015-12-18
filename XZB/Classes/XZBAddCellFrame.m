//
//  XZBAddCellFrame.m
//  XZB
//
//  Created by 王兆凯 on 15/9/1.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAddCellFrame.h"

@implementation XZBAddCellFrame
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
-(void)setSelectCircle:(XZBSelectCircle *)selectCircle
{
    _selectCircle = selectCircle;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGSize cityLableSize = [self sizeWithText:selectCircle.city font:XZBAddCellFont];
    CGFloat cityLableX = addCellBorder;
    CGFloat cityLableY = (addCellH - cityLableSize.height) / 2;
    self.cityLablef = CGRectMake(cityLableX, cityLableY, cityLableSize.width, cityLableSize.height);
    
    CGSize schoolLableSize = [self sizeWithText:selectCircle.school font:XZBAddCellFont];
    CGFloat schoolLableX = CGRectGetMaxX(self.cityLablef) + addMinCellBorder;
    CGFloat schoolLableY = (addCellH - schoolLableSize.height) / 2;
    self.schoolLablef = CGRectMake(schoolLableX, schoolLableY, schoolLableSize.width, schoolLableSize.height);
    
    CGSize instituteLableSize = [self sizeWithText:selectCircle.institute font:XZBAddCellFont];
    CGFloat instituteLableX = CGRectGetMaxX(self.schoolLablef) + addMinCellBorder;
    CGFloat instituteLableY = (addCellH - instituteLableSize.height) / 2;
    self.instituteLablef = CGRectMake(instituteLableX, instituteLableY, instituteLableSize.width, instituteLableSize.height);
    
    CGFloat selectIconWH = 15;
    CGFloat rightImageViewW = selectIconWH;
    CGFloat rightImageViewH = selectIconWH;
    CGFloat rightImageViewX = cellW - addCellSideMargin * 2 - rightImageViewW - addCellBorder;
    CGFloat rightImageViewY = (addCellH - selectIconWH) / 2;
    self.rightImageViewf = CGRectMake(rightImageViewX, rightImageViewY, rightImageViewW, rightImageViewH);
    
    CGFloat baseViewX = addCellSideMargin;
    CGFloat baseViewY = addCellTopMargin;
    CGFloat baseViewW = cellW - addCellSideMargin * 2;
    CGFloat baseViewH = addCellH;
    self.baseViewf = CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH);
    
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}
@end
