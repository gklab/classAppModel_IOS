//
//  XZBRegisterBotton.h
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBBaseGreenTextField.h"
#import "XZBChoseStatus.h"
@interface XZBRegisterBotton : UIView
@property(nonatomic,weak)XZBBaseGreenTextField *phoneNumber;
@property(nonatomic,weak)XZBBaseGreenTextField *passWord;
@property(nonatomic,weak)XZBBaseGreenTextField *checkPassWord;
@property(nonatomic,weak)XZBBaseGreenTextField *userName;
@property(nonatomic,weak)XZBBaseGreenTextField *code;
@property(nonatomic,weak)UIButton *getCodeBtn;
@property(nonatomic,weak)UIButton *checkBox;
@property(nonatomic,weak)UILabel *readLaw1;
@property(nonatomic,weak)UILabel *readLaw2;
@property(nonatomic,weak)UIButton *registerBtn;
@property(nonatomic,weak)UIButton *toLoginViewBtn;
@property(nonatomic,weak)UIButton *toResetAccountViewBtn;
@end
