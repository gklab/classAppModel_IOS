//
//  XZBUser.h
//  XZB
//
//  Created by 王兆凯 on 15/8/8.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZBUser : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *face_image_url;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *school;
@property (nonatomic, copy) NSString *institute;
@property (nonatomic, assign) NSInteger fansNum;
@property (nonatomic, assign) NSInteger attentionNum;
@end
