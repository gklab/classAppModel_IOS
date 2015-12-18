//
//  XZBMessageCell.m
//  XZB
//
//  Created by 王兆凯 on 15/8/30.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBMessageCell.h"
#import "XZBMessage.h"
#import "XZBUser.h"
@interface XZBMessageCell()
@property (nonatomic,weak) UIView *baseView;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *titleLable;

@property (nonatomic,weak) UIImageView *faceView;
@property (nonatomic,weak) UILabel *nameLable;
@property (nonatomic,weak) UILabel *contentLable;
@property (nonatomic,weak) UILabel *timeLable;

@end
@implementation XZBMessageCell

+ (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"message";
    XZBMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[XZBMessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    if(self)
    {
        UIView *baseView = [[UIView alloc] init];
        [self.contentView addSubview:baseView];
        self.baseView = baseView;
        
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.baseView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.font = XZBMessageCellNameFont;
        [self.baseView addSubview:titleLable];
        self.titleLable = titleLable;
        
        UIImageView *faceView = [[UIImageView alloc] init];
        [self.baseView addSubview:faceView];
        self.faceView = faceView;
        
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.font = XZBMessageCellNameFont;
        [self.baseView addSubview:nameLable];
        self.nameLable = nameLable;
        
        UILabel *contentLable = [[UILabel alloc] init];
        contentLable.font = XZBMessageCellContentFont;
        [self.baseView addSubview:contentLable];
        self.contentLable = contentLable;
        
        UILabel *timeLable = [[UILabel alloc] init];
        timeLable.font = XZBMessageCellTimeFont;
        [self.baseView addSubview:timeLable];
        self.timeLable = timeLable;
    }
    return self;
}
-(void)setMessageFrame:(XZBMessageFrame *)messageFrame
{
    self.baseView.backgroundColor = [UIColor whiteColor];
    XZBMessage *message = messageFrame.message;
    XZBUser *user = message.user;
    
    self.baseView.frame = messageFrame.baseViewf;
    if(messageFrame.cellType == 1)
    {
        self.iconView.image = [UIImage imageNamed:message.iconUrl];
        self.iconView.frame = messageFrame.iconViewf;
        
        self.titleLable.text = message.title;
        self.titleLable.frame = messageFrame.titleLablef;
    }
    else if(messageFrame.cellType == 2)
    {
        self.faceView.image = [UIImage imageNamed:user.face_image_url];
        self.faceView.frame = messageFrame.faceViewf;
        
        self.nameLable.text = user.name;
        self.nameLable.frame = messageFrame.nameLablef;
        
        self.contentLable.text = message.content;
        self.contentLable.frame = messageFrame.contentLablef;
        
        self.timeLable.text = message.time;
        self.timeLable.frame = messageFrame.timeLablef;
    }
}
@end