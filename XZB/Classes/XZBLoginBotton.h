//
//  XZBLoginBotton.h
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZBChoseStatus.h"
#import "XZBBaseGreenTextField.h"
#import "XZBRegisterViewController.h"
@interface XZBLoginBotton : UIView
@property(nonatomic,weak)XZBBaseGreenTextField *userName;
@property(nonatomic,weak)XZBBaseGreenTextField *passWord;
@property(nonatomic,weak)UIButton *registerBtn;
@property(nonatomic,weak)UIButton *resetAccountBtn;
@property(nonatomic,weak)UIButton *loginBtn;
@property(nonatomic,weak)XZBChoseStatus *choseStudent;
@property(nonatomic,weak)XZBChoseStatus *choseTeacher;
@end
