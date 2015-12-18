//
//  XZBInfo.h
//  XZB
//
//  Created by 王兆凯 on 15/8/8.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XZBUser;
@interface XZBInfo : NSObject
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) XZBUser *user;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSArray *photos;
@property (nonatomic, strong) XZBInfo *forwardInfo;
@end
