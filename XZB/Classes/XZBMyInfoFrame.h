//
//  XZBMyInfoFrame.h
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XZBUser.h"
#define XZBMyInfoCellMaxFont [UIFont fontWithName:nil size:15]
#define XZBMyInfoCellMidFont [UIFont fontWithName:nil size:14]
#define XZBMyInfoCellMinFont [UIFont fontWithName:nil size:13]
#define XZBCancleTitle @"注销登录"
@interface XZBMyInfoFrame : NSObject
@property (nonatomic,strong) XZBUser *user;
@property (nonatomic,assign) CGRect baseViewf;
@property (nonatomic,assign) CGRect topBaseViewf;
@property (nonatomic,assign) CGRect midBaseViewf;
@property (nonatomic,assign) CGRect butBaseViewf;
@property (nonatomic,assign) CGRect cancelBtnf;
@property (nonatomic,assign) CGRect statusLablef;
@property (nonatomic,assign) CGRect changeStatusBtnf;
@property (nonatomic,assign) CGRect setBtnf;
@property (nonatomic,assign) CGRect faceViewf;
@property (nonatomic,assign) CGRect faceImageViewf;
@property (nonatomic,assign) CGRect nameLablef;
@property (nonatomic,assign) CGRect cityLablef;
@property (nonatomic,assign) CGRect schoolLablef;
@property (nonatomic,assign) CGRect instituteLablef;
@property (nonatomic,assign) CGRect attentionBtnf;
@property (nonatomic,assign) CGRect fansBtnf;
@property (nonatomic,assign) CGRect centerToolBarf;
@property (nonatomic,assign) CGFloat cellHeight;
@end
