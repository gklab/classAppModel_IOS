//
//  XZBCircleButton.m
//  XZB
//
//  Created by 王兆凯 on 15/9/4.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBCircleButton.h"
#define XZBTitleFont [UIFont fontWithName:nil size:15]
#define XZBBorder 10
@implementation XZBCircleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    return [self sizeWithText:text font:font maxW:MAXFLOAT];
}

- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType buttonWidth:(CGFloat)circleWidth
{
    self.layer.cornerRadius = circleWidth/2;
    self.layer.masksToBounds = YES;
    CGSize titleSize = [self sizeWithText:title font:XZBTitleFont];
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-image.size.height/2,0.0,0.0,-titleSize.width)];
    [self setImage:image forState:stateType];
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setFont:XZBTitleFont];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(45.0,-image.size.width,0.0,0.0)];
    [self setTitle:title forState:stateType];
}
@end
