//
//  XZBPublishCell.m
//  XZB
//
//  Created by 王兆凯 on 15/8/29.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBPublishCell.h"
#import "XZBTextView.h"
@interface XZBPublishCell()
@property (nonatomic,weak) UIView *baseView;
@property (nonatomic,weak) XZBTextView *publishContentView;
@property (nonatomic,weak) UIImageView *publishPhotoView;
@property (nonatomic,weak) UIView *publishLocationView;
@property (nonatomic,weak) UIView *publishSeeWhoView;
@property (nonatomic,weak) UIView *publishCircleView;
@property (nonatomic,weak) UIView *publishAtWhoView;
@end
@implementation XZBPublishCell
+ (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"publish";
    XZBPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[XZBPublishCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    if(self)
    {
        UIView *baseView = [[UIView alloc] init];
        [self.contentView addSubview:baseView];
        self.baseView = baseView;
        
        XZBTextView *publishContentView = [[XZBTextView alloc] init];
        publishContentView.font = [UIFont systemFontOfSize:15];
        publishContentView.placeholder = @"发表内容";
        [self.baseView addSubview:publishContentView];
        self.publishContentView = publishContentView;
        
        UIImageView *publishPhotoView = [[UIImageView alloc] init];
        publishPhotoView.image = [UIImage imageNamed:@"actionbar_add_icon"];
        publishPhotoView.backgroundColor = [UIColor whiteColor];
        CALayer *layer = [publishPhotoView layer];
        layer.borderColor = [UIColor grayColor].CGColor;
        layer.borderWidth = 1.0f;
        [self.baseView addSubview:publishPhotoView];
        self.publishPhotoView = publishPhotoView;
        
        UIView *publishLocationView = [[UIView alloc] init];
        [self.baseView addSubview:publishLocationView];
        self.publishLocationView = publishLocationView;
        
        UIView *publishSeeWhoView = [[UIView alloc] init];
        [self.baseView addSubview:publishSeeWhoView];
        self.publishSeeWhoView = publishSeeWhoView;
        
        UIView *publishCircleView = [[UIView alloc] init];
        [self.baseView addSubview:publishCircleView];
        self.publishCircleView = publishCircleView;
        
        UIView *publishAtWhoView = [[UIView alloc] init];
        [self.baseView addSubview:publishAtWhoView];
        self.publishAtWhoView = publishAtWhoView;
    }
    return self;
}
-(void)setPublishFrame:(XZBPublishFrame *)publishFrame
{
    self.baseView.backgroundColor = [UIColor whiteColor];
    self.baseView.frame = publishFrame.baseViewf;
    if(publishFrame.cellType == 1)
    {
        self.publishContentView.frame = publishFrame.publishContentViewf;
        
        self.publishPhotoView.frame = publishFrame.publishPhotoViewf;
        
        self.publishLocationView.frame = publishFrame.publishLocationViewf;
        CGRect frame;
        frame.size.width = [UIScreen mainScreen].bounds.size.width;
        frame.size.height = publishFrame.publishLocationViewf.size.height;
        frame.origin = CGPointZero;
        UIButton *locationBtn = [[UIButton alloc] init];
        CALayer *layer = [locationBtn layer];
        layer.borderColor = [UIColor grayColor].CGColor;
        layer.borderWidth = 0.6f;
        locationBtn.frame = frame;
        [locationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [locationBtn setTitle:@"所在位置" forState:UIControlStateNormal];
        [self.publishLocationView addSubview:locationBtn];
    }
    else if(publishFrame.cellType == 2)
    {
        self.publishSeeWhoView.frame = publishFrame.publishSeeWhoViewf;
        CGRect frame;
        frame.size.width = [UIScreen mainScreen].bounds.size.width;
        frame.size.height = publishFrame.publishSeeWhoViewf.size.height;
        frame.origin = CGPointZero;
        UIButton *publishSeeWhoBtn = [[UIButton alloc] init];
        CALayer *layer = [publishSeeWhoBtn layer];
        layer.borderColor = [UIColor grayColor].CGColor;
        layer.borderWidth = 0.3f;
        publishSeeWhoBtn.frame = frame;
        [publishSeeWhoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [publishSeeWhoBtn setTitle:@"谁可以看" forState:UIControlStateNormal];
        [self.publishSeeWhoView addSubview:publishSeeWhoBtn];
        
        self.publishCircleView.frame = publishFrame.publishCircleViewf;
        frame.size.height = publishFrame.publishCircleViewf.size.height;
        UIButton *publishCircleBtn = [[UIButton alloc] init];
        layer = [publishCircleBtn layer];
        layer.borderColor = [UIColor grayColor].CGColor;
        layer.borderWidth = 0.3f;
        publishCircleBtn.frame = frame;
        [publishCircleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [publishCircleBtn setTitle:@"发送到圈子" forState:UIControlStateNormal];
        [self.publishCircleView addSubview:publishCircleBtn];
    }
    else if(publishFrame.cellType == 3)
    {
        self.publishAtWhoView.frame = publishFrame.publishAtWhoViewf;
        CGRect frame;
        frame.size.width = [UIScreen mainScreen].bounds.size.width;
        frame.size.height = publishFrame.publishAtWhoViewf.size.height;
        frame.origin = CGPointZero;
        UIButton *publishAtWhoBtn = [[UIButton alloc] init];
        CALayer *layer = [publishAtWhoBtn layer];
        layer.borderColor = [UIColor grayColor].CGColor;
        layer.borderWidth = 0.3f;
        publishAtWhoBtn.frame = frame;
        [publishAtWhoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [publishAtWhoBtn setTitle:@"提醒谁看" forState:UIControlStateNormal];
        [self.publishLocationView addSubview:publishAtWhoBtn];
    }
}
@end