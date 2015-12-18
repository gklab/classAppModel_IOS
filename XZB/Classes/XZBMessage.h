//
//  XZBMessage.h
//  XZB
//
//  Created by 王兆凯 on 15/8/30.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZBUser.h"
@interface XZBMessage : NSObject
@property (nonatomic, strong) XZBUser *user;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *title;
@end
