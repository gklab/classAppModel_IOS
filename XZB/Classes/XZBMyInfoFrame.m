//
//  XZBMyInfoFrame.m
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBMyInfoFrame.h"
#define LMaxcellBorder 20
#define cellBorder 10
#define mincellBorder 3
#define midcellBorder 5
@implementation XZBMyInfoFrame
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
-(void)setUser:(XZBUser *)user
{
    _user = user;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat cancelBtnX = cellBorder;
    CGFloat cancelBtnY = cellBorder + [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGSize cancelBtnSize = [self sizeWithText:XZBCancleTitle font:XZBMyInfoCellMinFont];
    self.cancelBtnf = CGRectMake(cancelBtnX, cancelBtnY, cancelBtnSize.width, cancelBtnSize.height);
    
    CGFloat statusLableY = cancelBtnY;
    CGSize statusLableSize = [self sizeWithText:self.user.status font:XZBMyInfoCellMaxFont];
    CGFloat changeStatusBtnY = statusLableY;
    CGFloat changeStatusBtnW = statusLableSize.height;
    CGFloat changeStatusBtnH = statusLableSize.height;
    
    CGFloat statusLableX = (cellW - statusLableSize.width - changeStatusBtnW - mincellBorder)/2;
    self.statusLablef = CGRectMake(statusLableX, statusLableY, statusLableSize.width, statusLableSize.height);
    CGFloat changeStatusBtnX = CGRectGetMaxX(self.statusLablef)+mincellBorder;
    self.changeStatusBtnf = CGRectMake(changeStatusBtnX, changeStatusBtnY, changeStatusBtnW, changeStatusBtnH);

    CGFloat setBtnW = cancelBtnSize.height;
    CGFloat setBtnH = cancelBtnSize.height;
    CGFloat setBtnX = cellW - setBtnW - cellBorder;
    CGFloat setBtnY = changeStatusBtnY;
    self.setBtnf = CGRectMake(setBtnX, setBtnY, setBtnW, setBtnH);
    
    CGFloat topBaseViewX = 0;
    CGFloat topBaseViewY = 0;
    CGFloat topBaseViewW = cellW;
    CGFloat topBaseViewH = MAX(CGRectGetMaxY(self.cancelBtnf), CGRectGetMaxY(self.statusLablef))+cellBorder;
    self.topBaseViewf = CGRectMake(topBaseViewX, topBaseViewY, topBaseViewW, topBaseViewH);
    
    CGFloat faceViewW = 130;
    CGFloat faceViewH = 130;
    CGFloat faceViewX = (cellW - faceViewW)/2;
    CGFloat faceViewY = cellBorder;
    self.faceViewf = CGRectMake(faceViewX, faceViewY, faceViewW, faceViewH);
    
    CGFloat faceImageViewW = 110;
    CGFloat faceImageViewH = 110;
    CGFloat faceImageViewX = (faceViewW - faceImageViewW)/2;
    CGFloat faceImageViewY = (faceViewH - faceImageViewH)/2;;
    self.faceImageViewf = CGRectMake(faceImageViewX, faceImageViewY, faceImageViewW, faceImageViewH);
    
    CGSize nameLableSize = [self sizeWithText:user.name font:XZBMyInfoCellMaxFont];
    CGFloat nameLableX = (cellW - nameLableSize.width)/2;
    CGFloat nameLableY = CGRectGetMaxY(self.faceViewf) + midcellBorder;
    self.nameLablef = CGRectMake(nameLableX, nameLableY, nameLableSize.width, nameLableSize.height);
    
    NSString *schoolString = [NSString stringWithFormat:@"%@|%@",user.city,user.school];
    CGSize schoolLableSize = [self sizeWithText:schoolString font:XZBMyInfoCellMinFont];
    CGFloat schoolLableY = CGRectGetMaxY(self.nameLablef) + cellBorder;
    
    CGSize instituteLableSize = [self sizeWithText:user.institute font:XZBMyInfoCellMinFont];
    CGFloat instituteLableY = schoolLableY;
    CGFloat schoolLableX = (cellW - schoolLableSize.width - instituteLableSize.width - midcellBorder)/2;
    self.schoolLablef = CGRectMake(schoolLableX, schoolLableY, schoolLableSize.width, schoolLableSize.height);
    
    CGFloat instituteLableX = CGRectGetMaxX(self.schoolLablef) + midcellBorder;;
    self.instituteLablef = CGRectMake(instituteLableX, instituteLableY, instituteLableSize.width, instituteLableSize.height);
    
    NSString *attentionString = [NSString stringWithFormat:@"关注(%ld)",user.attentionNum];
    CGSize attentionBtnSize = [self sizeWithText:attentionString font:XZBMyInfoCellMidFont];
    CGFloat attentionBtnY = CGRectGetMaxY(self.schoolLablef) + LMaxcellBorder;
    
    NSString *fansString = [NSString stringWithFormat:@"粉丝(%ld)",user.fansNum];
    CGSize fansBtnSize = [self sizeWithText:fansString font:XZBMyInfoCellMidFont];
    
    CGFloat attentionBtnX = (cellW - attentionBtnSize.width - fansBtnSize.width - cellBorder)/2;
    
    self.attentionBtnf = CGRectMake(attentionBtnX, attentionBtnY, attentionBtnSize.width, attentionBtnSize.height);
    
    CGFloat fansBtnY = attentionBtnY;
    CGFloat fansBtnX = CGRectGetMaxX(self.attentionBtnf) + cellBorder;
    
    self.fansBtnf = CGRectMake(fansBtnX, fansBtnY, fansBtnSize.width, fansBtnSize.height);
    
    CGFloat midBaseViewX = 0;
    CGFloat midBaseViewY = CGRectGetMaxY(self.topBaseViewf);
    CGFloat midBaseViewW = cellW;
    CGFloat midBaseViewH = CGRectGetMaxY(self.fansBtnf) - self.topBaseViewf.origin.y;
    self.midBaseViewf = CGRectMake(midBaseViewX, midBaseViewY, midBaseViewW, midBaseViewH);
    
    CGFloat baseX = 0;
    CGFloat baseY = -[[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat baseW = cellW;
    CGFloat baseH = CGRectGetMaxY(self.midBaseViewf) + cellBorder;
    self.baseViewf = CGRectMake(baseX, baseY, baseW, baseH);
    
    CGFloat centerToolBarX = 0;
    CGFloat centerToolBarY = CGRectGetMaxY(self.baseViewf);
    CGFloat centerToolBarW = cellW;
    CGFloat centerToolBarH = 36;
    self.centerToolBarf = CGRectMake(centerToolBarX, centerToolBarY, centerToolBarW, centerToolBarH);
    
    self.cellHeight = CGRectGetMaxY(self.centerToolBarf);
}
@end
