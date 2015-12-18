//
//  XZBTabBar.h
//  XZB
//
//  Created by 王兆凯 on 15/8/8.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XZBTabBar;
@protocol XZBTabBarDelegate<UITabBarDelegate>
@optional
-(void) tabBarDidClickPlusButton:(XZBTabBar *)tabBar;
@end
@interface XZBTabBar : UITabBar
@property (nonatomic,weak) id<XZBTabBarDelegate> _delegate;
@end
