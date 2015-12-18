//
//  XZBAnswerCell.m
//  XZB
//
//  Created by 王兆凯 on 15/8/18.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAnswerCell.h"
#import "XZBInfoFrame.h"
#import "XZBUser.h"
#import "XZBPhoto.h"
#import "XZBInfo.h"
#import "XZBInfoToolbar.h"
@interface XZBAnswerCell()
@property (nonatomic,weak) UIView *baseView;
@property (nonatomic,weak) UIImageView *faceView;
@property (nonatomic,weak) UIImageView *photoView;
@property (nonatomic,weak) UILabel *nameLable;
@property (nonatomic,weak) UILabel *contentLable;
@property (nonatomic,weak) UILabel *school;
@property (nonatomic,weak) UILabel *institute;
@property (nonatomic,weak) UILabel *timeLable;
@property (nonatomic,weak) UILabel *forwardContentLable;
@property (nonatomic,weak) UIImageView *forwardPhotosView;
@property (nonatomic,weak) UIView *forwardBaseView;
@property (nonatomic,weak) XZBInfoToolbar *toolbar;
@end
@implementation XZBAnswerCell
+ (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"answer";
    XZBAnswerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[XZBAnswerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
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
        
        UIImageView *faceView = [[UIImageView alloc] init];
        [self.baseView addSubview:faceView];
        self.faceView = faceView;
        
        UIImageView *photoView = [[UIImageView alloc] init];
        [self.baseView addSubview:photoView];
        self.photoView = photoView;
        
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.font = XZBInfoCellNameFont;
        [self.baseView addSubview:nameLable];
        self.nameLable = nameLable;
        
        UILabel *contentLable = [[UILabel alloc] init];
        contentLable.font = XZBInfoCellContentFont;
        contentLable.numberOfLines = 0;
        [self.baseView addSubview:contentLable];
        self.contentLable = contentLable;
        
        UILabel *school = [[UILabel alloc] init];
        school.font = XZBInfoCellTimeFont;
        [self.baseView addSubview:school];
        self.school = school;
        
        UILabel *institute = [[UILabel alloc] init];
        institute.font = XZBInfoCellTimeFont;
        [self.baseView addSubview:institute];
        self.institute = institute;
        
        UILabel *timeLable = [[UILabel alloc] init];
        timeLable.font = XZBInfoCellTimeFont;
        [self.baseView addSubview:timeLable];
        self.timeLable = timeLable;
        
        UIView *forwardBaseView = [[UIView alloc] init];
        [self.baseView addSubview:forwardBaseView];
        self.forwardBaseView = forwardBaseView;
        
        UILabel *forwardContentLable = [[UILabel alloc] init];
        forwardContentLable.font = XZBInfoCellContentFont;
        forwardContentLable.numberOfLines = 0;
        [self.forwardBaseView addSubview:forwardContentLable];
        self.forwardContentLable = forwardContentLable;
        
        UIImageView *forwardPhotosView = [[UIImageView alloc] init];
        [self.forwardBaseView addSubview:forwardPhotosView];
        self.forwardPhotosView = forwardPhotosView;
        
        XZBInfoToolbar *toolbar = [XZBInfoToolbar toolbar];
        [self addSubview:toolbar];
        self.toolbar = toolbar;
    }
    return self;
}
-(void)setInfoFrame:(XZBInfoFrame *)infoFrame
{
    self.baseView.backgroundColor = [UIColor whiteColor];
    self.forwardBaseView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    _infoFrame = infoFrame;
    XZBInfo *info = infoFrame.info;
    XZBUser *user = info.user;
    XZBInfo *forwardInfo = info.forwardInfo;
    XZBUser *forwardUser = forwardInfo.user;
    self.baseView.frame = infoFrame.baseViewf;
    
    self.faceView.image = [UIImage imageNamed:user.face_image_url];
    self.faceView.frame = infoFrame.faceViewf;
    
    self.faceView.image = [UIImage imageNamed:user.face_image_url];
    self.photoView.frame = infoFrame.photosViewf;
    
    self.nameLable.text = info.user.name;
    self.nameLable.frame = infoFrame.nameLablef;
    
    self.contentLable.text = info.content;
    self.contentLable.frame = infoFrame.contentLablef;
    
    self.school.text = user.school;
    self.school.frame = infoFrame.schoolLablef;
    
    self.institute.text = user.institute;
    self.institute.frame = infoFrame.instituteLablef;
    
    if(info.photos.count)
    {
        self.imageView.hidden = NO;
        self.imageView.frame = infoFrame.photosViewf;
        XZBPhoto *pic = [info.photos firstObject];
        self.photoView.image = [UIImage imageNamed:pic.url];
    }
    else
    {
        self.imageView.hidden = YES;
        if(forwardInfo != nil)
        {
            NSString *forwardString = [[NSString alloc] initWithFormat:@"@%@:%@",forwardUser.name,forwardInfo.content];
            self.forwardContentLable.text = forwardString;
            self.forwardContentLable.frame = infoFrame.forwardContentLablef;
            
            if(forwardInfo.photos != nil)
            {
                XZBPhoto *pic = [forwardInfo.photos firstObject];
                self.forwardPhotosView.image = [UIImage imageNamed:pic.url];
                self.forwardPhotosView.frame = infoFrame.forwardPhotosViewf;
                
                self.forwardPhotosView.hidden = NO;
            }
            else
            {
                self.forwardPhotosView.hidden = YES;
            }
            
            self.forwardBaseView.frame = infoFrame.forwardBaseViewf;
            self.forwardBaseView.hidden = NO;
        }
        else
        {
            self.forwardBaseView.hidden = YES;
        }
    }
    
    
    self.timeLable.text = info.created_at;
    self.timeLable.frame = infoFrame.timeLablef;
    
    
    self.contentView.frame = infoFrame.contentLablef;
    
    self.toolbar.frame = infoFrame.toolbarf;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
