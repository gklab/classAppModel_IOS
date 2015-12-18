//
//  XZBInfoFrame.m
//  XZB
//
//  Created by 王兆凯 on 15/8/18.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBInfoFrame.h"
#import "XZBInfo.h"
#import "XZBUser.h"
#define cellBorder 10
@implementation XZBInfoFrame
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
-(void)setInfo:(XZBInfo *)info
{
    _info = info;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat faceWH = 50;
    CGFloat faceX = cellBorder;
    CGFloat faceY = cellBorder;
    self.faceViewf = CGRectMake(faceX, faceY, faceWH, faceWH);
    
    CGFloat nameX = CGRectGetMaxX(self.faceViewf) + cellBorder;
    CGFloat nameY = faceY;
    CGSize nameSize = [self sizeWithText:self.info.user.name font:XZBInfoCellNameFont];
    self.nameLablef = CGRectMake(nameX, nameY,nameSize.width, nameSize.height);
    
    CGFloat schoolX = nameX;
    CGFloat schoolY = CGRectGetMaxY(self.nameLablef) + cellBorder;
    CGSize schoolSize = [self sizeWithText:info.created_at font:XZBInfoCellTimeFont];
    self.schoolLablef = (CGRect){{schoolX, schoolY}, schoolSize};
    
    CGFloat instituteX = CGRectGetMaxX(self.schoolLablef) + cellBorder;
    CGFloat instituteY = schoolY;
    CGSize instituteSize = [self sizeWithText:self.info.user.institute font:XZBInfoCellTimeFont];
    self.instituteLablef = CGRectMake(instituteX, instituteY,instituteSize.width, instituteSize.height);
    
    CGFloat contentX = faceX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.faceViewf), CGRectGetMaxY(self.instituteLablef)) + cellBorder;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [self sizeWithText:self.info.content font:XZBInfoCellContentFont maxW:maxW];
    self.contentLablef = (CGRect){{contentX, contentY}, contentSize};
    
    if(info.photos.count)
    {
        CGFloat photoX = contentX;
        CGFloat photoY = CGRectGetMaxY(self.contentLablef) + cellBorder;
        CGFloat photoW = 100;
        self.photosViewf = CGRectMake(photoX, photoY,photoW, photoW);
        
        CGFloat timeX = photoX;
        CGFloat timeY = CGRectGetMaxY(self.photosViewf) + cellBorder;
        CGSize timeSize = [self sizeWithText:info.created_at font:XZBInfoCellTimeFont];
        self.timeLablef = (CGRect){{timeX, timeY}, timeSize};
    }
    else
    {
        if(info.forwardInfo !=nil)
        {
            CGFloat forwardContentX = cellBorder;
            CGFloat forwardContentY = cellBorder;
            NSString *forwardString = [[NSString alloc] initWithFormat:@"@%@:%@",info.forwardInfo.user.name,info.forwardInfo.content];
            CGSize forwardContentSize = [self sizeWithText:forwardString font:XZBInfoCellContentFont maxW:maxW];
            self.forwardContentLablef = (CGRect){{forwardContentX, forwardContentY}, forwardContentSize};
            
            if(info.forwardInfo.photos !=nil)
            {
                CGFloat forwardPhotoX = forwardContentX;
                CGFloat forwardPhotoY = CGRectGetMaxY(self.forwardContentLablef) + cellBorder;
                CGFloat forwardPhotoW = 100;
                self.forwardPhotosViewf = CGRectMake(forwardPhotoX, forwardPhotoY,forwardPhotoW, forwardPhotoW);
                
                CGFloat forwardBaseX = 0;
                CGFloat forwardBaseY = CGRectGetMaxY(self.contentLablef) + cellBorder;
                CGFloat forwardBaseW = cellW;
                CGFloat forwardBaseH = CGRectGetMaxY(self.forwardPhotosViewf) + cellBorder;
                self.forwardBaseViewf = CGRectMake(forwardBaseX, forwardBaseY, forwardBaseW, forwardBaseH);
            }
            else
            {
                CGFloat forwardBaseX = 0;
                CGFloat forwardBaseY = CGRectGetMaxY(self.contentLablef) + cellBorder;
                CGFloat forwardBaseW = cellW;
                CGFloat forwardBaseH = CGRectGetMaxY(self.forwardContentLablef) + cellBorder;
                self.forwardBaseViewf = CGRectMake(forwardBaseX, forwardBaseY, forwardBaseW, forwardBaseH);
            }
            CGFloat timeX = contentX;
            CGFloat timeY = CGRectGetMaxY(self.forwardBaseViewf) + cellBorder;
            CGSize timeSize = [self sizeWithText:info.created_at font:XZBInfoCellTimeFont];
            self.timeLablef = (CGRect){{timeX, timeY}, timeSize};
        }
        else
        {
            CGFloat timeX = contentX;
            CGFloat timeY = CGRectGetMaxY(self.contentLablef) + cellBorder;
            CGSize timeSize = [self sizeWithText:info.created_at font:XZBInfoCellTimeFont];
            self.timeLablef = (CGRect){{timeX, timeY}, timeSize};
        }
    }
    
    CGFloat baseX = 0;
    CGFloat baseY = XZBInfoCellMargin;
    CGFloat baseW = cellW;
    CGFloat baseH = CGRectGetMaxY(self.timeLablef) + cellBorder;
    self.baseViewf = CGRectMake(baseX, baseY, baseW, baseH);
    
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.baseViewf);
    CGFloat toolbarW = cellW;
    CGFloat toolbarH = 38;
    self.toolbarf = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
    
    self.cellHeight = CGRectGetMaxY(self.toolbarf);
}
@end
