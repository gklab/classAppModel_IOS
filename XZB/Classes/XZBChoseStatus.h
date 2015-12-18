//
//  XZBChoseStatus.h
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZBChoseStatus : UIView
@property(nonatomic,weak)UIButton *checkBox;
- (void)initWithImgName:(NSString *)imgName ChoseTitle:(NSString *)choseTitleName TipTitle:(NSString *)tipTitleName;
@end
