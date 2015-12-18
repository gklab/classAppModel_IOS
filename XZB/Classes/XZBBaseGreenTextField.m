//
//  XZBBaseGreenTextField.m
//  XZB
//
//  Created by 王兆凯 on 15/9/5.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBBaseGreenTextField.h"

@implementation XZBBaseGreenTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initWithFrame:(CGRect) frame Title:(NSString *)title Font:(UIFont *) font IsPassWord:(BOOL) is
{
    UIColor *XZBGreen = [UIColor colorWithRed:78.0/255 green:214.0/255 blue:178.0/255 alpha:1];
    self.backgroundColor = [UIColor whiteColor];
    self.textColor = XZBGreen;
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName: XZBGreen}];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.frame = frame;
    self.font = font;
    CALayer *layer = [self layer];
    layer.borderColor = XZBGreen.CGColor;
    layer.borderWidth = 1.0f;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = paddingView;
    self.secureTextEntry = is;
    
    
}
@end
