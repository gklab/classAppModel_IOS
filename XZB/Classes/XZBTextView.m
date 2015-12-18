//
//  XZBTextView.m
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBTextView.h"

@implementation XZBTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if(!self.hasText)
    {
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = self.font;
        attrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
        [self.placeholder drawAtPoint:CGPointMake(5, 8) withAttributes:attrs];
    }
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(placeDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
-(void)placeDidChange
{
    [self setNeedsDisplay];
}
@end
