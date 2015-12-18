//
//  XZBTabBar.m
//  XZB
//
//  Created by 王兆凯 on 15/8/8.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBTabBar.h"
@interface XZBTabBar()
@property (nonatomic,weak) UIButton *plusBtn;
@end
@implementation XZBTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"大圈主"] forState:UIControlStateNormal];
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        CGRect wframe = plusBtn.frame;
        wframe.size = plusBtn.currentBackgroundImage.size;
        plusBtn.frame = wframe;
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}
-(void) plusClick
{
    if([self._delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)])
    {
        [self._delegate tabBarDidClickPlusButton:self];
    }
}
-(void)layoutSubviews
{
    CGPoint wpoint;
    wpoint.x = self.frame.size.width/2;
    wpoint.y = self.frame.size.height/2;
    self.plusBtn.center = wpoint;
    
    [super layoutSubviews];
    long count = self.subviews.count;
    int index = 0;
    for (int i = 0; i<count; i++)
    {
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if([child isKindOfClass:class])
        {
            CGRect wframe = child.frame;
            wframe.size.width = self.frame.size.width / 5;
            wframe.origin.x = wframe.size.width*index;
            child.frame = wframe;
            index++;
            //NSLog(@"%d",index);
            if(index == 2)
            {
                index++;
            }
        }
    }
}

@end
