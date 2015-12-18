//
//  XZBResetAccountBotton.h
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBBaseGreenTextField.h"
@interface XZBResetAccountBotton : UIView
@property(nonatomic,weak)UILabel *topLable;
@property(nonatomic,weak)XZBBaseGreenTextField *phoneNumber;
@property(nonatomic,weak)XZBBaseGreenTextField *code;
@property(nonatomic,weak)UIButton *getCodeBtn;
@property(nonatomic,weak)XZBBaseGreenTextField *passWord;
@property(nonatomic,weak)XZBBaseGreenTextField *checkPassWord;
@property(nonatomic,weak)UIButton *okBtn;
@end
