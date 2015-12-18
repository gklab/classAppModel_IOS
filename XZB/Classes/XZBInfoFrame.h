//
//  XZBInfoFrame.h
//  XZB
//
//  Created by 王兆凯 on 15/8/18.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XZBInfo;
// 昵称字体
#define XZBInfoCellNameFont [UIFont fontWithName:nil size:15]
// 时间字体
#define XZBInfoCellTimeFont [UIFont fontWithName:nil size:14]
// 正文字体
#define XZBInfoCellContentFont [UIFont fontWithName:nil size:15]

#define XZBInfoCellMargin 20;

@interface XZBInfoFrame : NSObject
@property (nonatomic,strong) XZBInfo *info;
@property (nonatomic,assign) CGRect baseViewf;
@property (nonatomic,assign) CGRect faceViewf;
@property (nonatomic,assign) CGRect photosViewf;
@property (nonatomic,assign) CGRect nameLablef;
@property (nonatomic,assign) CGRect contentLablef;
@property (nonatomic,assign) CGRect schoolLablef;
@property (nonatomic,assign) CGRect instituteLablef;
@property (nonatomic,assign) CGRect timeLablef;
@property (nonatomic,assign) CGRect forwardContentLablef;
@property (nonatomic,assign) CGRect forwardPhotosViewf;
@property (nonatomic,assign) CGRect forwardBaseViewf;
@property (nonatomic,assign) CGRect toolbarf;
@property (nonatomic,assign) CGFloat cellHeight;
@end
