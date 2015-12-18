//
//  XZBBaseCellFrame.h
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define XZBBaseCellMaxFont [UIFont fontWithName:nil size:15]
@interface XZBBaseCellFrame : NSObject
@property (nonatomic, strong) NSMutableArray *baseCellInfos;
@property (nonatomic, strong) NSMutableArray *baseCellBtnsf;
@property (nonatomic, assign) CGRect baseViewf;
@property (nonatomic, assign) CGRect iconImageViewf;
@property (nonatomic, assign) CGRect titleLablef;
@property (nonatomic, assign) CGRect rightIcon;
@property (nonatomic,assign) CGFloat cellHeight;
- (void)setInfoIcon:(NSString *)icon_url title:(NSString *)title;
-(void)myBaseCellInfos;
@end
