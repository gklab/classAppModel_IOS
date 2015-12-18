//
//  XZBPublishFrame.h
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define XZBInfoCellMargin 20;
@interface XZBPublishFrame : NSObject
@property (nonatomic,assign) CGRect baseViewf;
@property (nonatomic,assign) CGRect publishContentViewf;
@property (nonatomic,assign) CGRect publishPhotoViewf;
@property (nonatomic,assign) CGRect publishLocationViewf;
@property (nonatomic,assign) CGRect publishSeeWhoViewf;
@property (nonatomic,assign) CGRect publishCircleViewf;
@property (nonatomic,assign) CGRect publishAtWhoViewf;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) int cellType;
-(void)toSetPublishCell1;
-(void)toSetPublishCell2;
-(void)toSetPublishCell3;
@end