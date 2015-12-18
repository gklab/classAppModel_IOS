//
//  XZBAddCellFrame.h
//  XZB
//
//  Created by 王兆凯 on 15/9/1.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XZBSelectCircle.h"
#define XZBAddCellFont [UIFont fontWithName:nil size:13]
#define addCellBorder 20
#define addMinCellBorder 3
#define addCellH 40
#define addCellSideMargin 30
#define addCellTopMargin 15
@interface XZBAddCellFrame : NSObject
@property (nonatomic,strong) XZBSelectCircle *selectCircle;
@property (nonatomic,assign) CGRect baseViewf;
@property (nonatomic,assign) CGRect cityLablef;
@property (nonatomic,assign) CGRect schoolLablef;
@property (nonatomic,assign) CGRect instituteLablef;
@property (nonatomic,assign) CGRect rightImageViewf;
@property (nonatomic,assign) CGFloat cellHeight;
@end
