//
//  XZBPublishFrame.m
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBPublishFrame.h"
#define cellBorder 10
#define cellBtnH 40
@implementation XZBPublishFrame
-(void)toSetPublishCell1
{
    /* cell 1*/
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat publishContentW = cellW;
    CGFloat publishContentH = [UIScreen mainScreen].bounds.size.height/4;
    CGFloat publishContentX = 0;
    CGFloat publishContentY = 0;
    self.publishContentViewf = CGRectMake(publishContentX, publishContentY, publishContentW, publishContentH);
    
    CGFloat publishPhotoX = cellBorder;
    CGFloat publishPhotoY = CGRectGetMaxY(self.publishContentViewf)+cellBorder;
    CGFloat publishPhotoW = 100;
    CGFloat publishPhotoH = 100;
    self.publishPhotoViewf = CGRectMake(publishPhotoX, publishPhotoY,publishPhotoW, publishPhotoH);
    
    CGFloat publishLocationX = 0;
    CGFloat publishLocationY = CGRectGetMaxY(self.publishPhotoViewf)+cellBorder;
    CGFloat publishLocationW = cellW;
    CGFloat publishLocationH = cellBtnH;
    self.publishLocationViewf = CGRectMake(publishLocationX, publishLocationY,publishLocationW, publishLocationH);
    
    CGFloat baseX = 0;
    CGFloat baseY = XZBInfoCellMargin;
    CGFloat baseW = cellW;
    CGFloat baseH = CGRectGetMaxY(self.publishLocationViewf);
    self.baseViewf = CGRectMake(baseX, baseY, baseW, baseH);
    
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}
-(void)toSetPublishCell2
{
    /* cell 2*/
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat publishSeeWhoX = 0;
    CGFloat publishSeeWhoY = 0;
    CGFloat publishSeeWhoW = cellW;
    CGFloat publishSeeWhoH = cellBtnH;
    self.publishSeeWhoViewf = CGRectMake(publishSeeWhoX, publishSeeWhoY,publishSeeWhoW, publishSeeWhoH);

    CGFloat publishCircleX = 0;
    CGFloat publishCircleY = CGRectGetMaxY(self.publishSeeWhoViewf);
    CGFloat publishCircleW = cellW;
    CGFloat publishCircleH = cellBtnH;
    self.publishCircleViewf = CGRectMake(publishCircleX, publishCircleY,publishCircleW, publishCircleH);
    
    CGFloat baseX = 0;
    CGFloat baseY = XZBInfoCellMargin;
    CGFloat baseW = cellW;
    CGFloat baseH = CGRectGetMaxY(self.publishCircleViewf);
    self.baseViewf = CGRectMake(baseX, baseY, baseW, baseH);
    
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}
-(void)toSetPublishCell3
{
    /* cell 3*/
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat publishAtWhoX = 0;
    CGFloat publishAtWhoY = 0;
    CGFloat publishAtWhoW = cellW;
    CGFloat publishAtWhoH = cellBtnH;
    self.publishAtWhoViewf = CGRectMake(publishAtWhoX, publishAtWhoY,publishAtWhoW, publishAtWhoH);
    
    CGFloat baseX = 0;
    CGFloat baseY = XZBInfoCellMargin;
    CGFloat baseW = cellW;
    CGFloat baseH = CGRectGetMaxY(self.publishAtWhoViewf);
    self.baseViewf = CGRectMake(baseX, baseY, baseW, baseH);
    
    self.cellHeight = CGRectGetMaxY(self.baseViewf);
}

@end
