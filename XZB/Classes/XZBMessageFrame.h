//
//  XZBMessageFrame.h
//  XZB
//
//  Created by 王兆凯 on 15/8/30.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XZBMessage.h"
// 昵称字体
#define XZBMessageCellNameFont [UIFont fontWithName:nil size:15]
// 时间字体
#define XZBMessageCellTimeFont [UIFont fontWithName:nil size:14]
// 正文字体
#define XZBMessageCellContentFont [UIFont fontWithName:nil size:13]
@interface XZBMessageFrame : NSObject
@property (nonatomic,strong) XZBMessage *message;
@property (nonatomic,assign) CGRect baseViewf;

@property (nonatomic,assign) CGRect iconViewf;
@property (nonatomic,assign) CGRect titleLablef;

@property (nonatomic,assign) CGRect faceViewf;
@property (nonatomic,assign) CGRect nameLablef;
@property (nonatomic,assign) CGRect contentLablef;
@property (nonatomic,assign) CGRect timeLablef;

@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) int cellType;
-(void)toSetMessageCell1IsTop:(BOOL)isTop;
-(void)toSetMessageCell2IsTop:(BOOL)isTop;
@end
