//
//  XZBMyInfoCell.m
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBMyInfoCell.h"
#import "XZBMyInfoFrame.h"
#import "XZBCenterToolBar.h"
@interface XZBMyInfoCell()
@property (nonatomic,weak) UIView *baseView;
@property (nonatomic,weak) UIView *topBaseView;
@property (nonatomic,weak) UIView *midBaseView;
@property (nonatomic,weak) UIView *butBaseView;
@property (nonatomic,weak) UIButton *cancelBtn;
@property (nonatomic,weak) UILabel *statusLable;
@property (nonatomic,weak) UIButton *changeStatusBtn;
@property (nonatomic,weak) UIButton *setBtn;
@property (nonatomic,weak) UIView *faceView;
@property (nonatomic,weak) UIImageView *faceImageView;
@property (nonatomic,weak) UILabel *nameLable;
@property (nonatomic,weak) UILabel *cityLable;
@property (nonatomic,weak) UILabel *schoolLable;
@property (nonatomic,weak) UILabel *instituteLable;
@property (nonatomic,weak) UIButton *attentionBtn;
@property (nonatomic,weak) UIButton *fansBtn;
@property (nonatomic,weak) UIButton *whisperBtn;
@property (nonatomic,weak) UIButton *serviceBtn;
@property (nonatomic,weak) UIButton *courseBtn;
@property (nonatomic,weak) XZBCenterToolBar *centerToolBar;
@end
@implementation XZBMyInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"myInfo";
    XZBMyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[XZBMyInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
        self.baseView = baseView;
        [self.contentView addSubview:baseView];
        
        UIView *topBaseView = [[UIView alloc] init];
        [self.baseView addSubview:topBaseView];
        self.topBaseView = topBaseView;
        
        UIButton *cancelBtn = [[UIButton alloc] init];
        cancelBtn.titleLabel.font = XZBMyInfoCellMinFont;
        cancelBtn.backgroundColor = [UIColor clearColor];
        [self.topBaseView addSubview:cancelBtn];
        self.cancelBtn = cancelBtn;
        
        UILabel *statusLable = [[UILabel alloc] init];
        statusLable.font = XZBMyInfoCellMaxFont;
        statusLable.backgroundColor = [UIColor clearColor];
        [self.topBaseView addSubview:statusLable];
        self.statusLable = statusLable;
        
        UIButton *changeStatusBtn = [[UIButton alloc] init];
        [changeStatusBtn setImage:[UIImage imageNamed:@"大圈主"] forState:UIControlStateNormal];
        [self.topBaseView addSubview:changeStatusBtn];
        self.changeStatusBtn = changeStatusBtn;
        
        UIButton *setBtn = [[UIButton alloc] init];
        [setBtn setImage:[UIImage imageNamed:@"大圈主"] forState:UIControlStateNormal];
        [self.topBaseView addSubview:setBtn];
        self.setBtn = setBtn;
        [self.topBaseView addSubview:setBtn];
        self.setBtn = setBtn;
        
        UIView *midBaseView = [[UIView alloc] init];
        [self.baseView addSubview:midBaseView];
        self.midBaseView = midBaseView;
        
        UIView *faceView = [[UIView alloc] init];
        faceView.backgroundColor = [UIColor clearColor];
        [self.midBaseView addSubview:faceView];
        self.faceView = faceView;
        
        UIImageView *faceImageView = [[UIImageView alloc] init];
        faceImageView.backgroundColor = [UIColor whiteColor];
        [self.faceView addSubview:faceImageView];
        self.faceImageView = faceImageView;
        
        UILabel *nameLable = [[UILabel alloc] init];
        [self.midBaseView addSubview:nameLable];
        nameLable.font = XZBMyInfoCellMaxFont;
        self.nameLable = nameLable;
        
        UILabel *schoolLable = [[UILabel alloc] init];
        [self.midBaseView addSubview:schoolLable];
        schoolLable.font = XZBMyInfoCellMinFont;
        self.schoolLable = schoolLable;
        
        UILabel *instituteLable = [[UILabel alloc] init];
        [self.midBaseView addSubview:instituteLable];
        instituteLable.font = XZBMyInfoCellMinFont;
        self.instituteLable = instituteLable;
        
        UIButton *attentionBtn = [[UIButton alloc] init];
        [self.midBaseView addSubview:attentionBtn];
        attentionBtn.titleLabel.font = XZBMyInfoCellMidFont;
        self.attentionBtn = attentionBtn;
        
        UIButton *fansBtn = [[UIButton alloc] init];
        [self.midBaseView addSubview:fansBtn];
        fansBtn.titleLabel.font = XZBMyInfoCellMidFont;
        self.fansBtn = fansBtn;
        
        XZBCenterToolBar *centerBar = [XZBCenterToolBar toolbar];
        [self.contentView addSubview:centerBar];
        self.centerToolBar = centerBar;
    }
    return self;
}



-(void)setMyInfoFrame:(XZBMyInfoFrame *)myInfoFrame
{
    XZBUser *user = myInfoFrame.user;
    self.baseView.frame = myInfoFrame.baseViewf;
    UIImage *backImg = [UIImage imageNamed:@"backImg"];
    
    self.baseView.layer.contents = (id)backImg.CGImage;
    self.topBaseView.frame = myInfoFrame.topBaseViewf;
    self.cancelBtn.frame = myInfoFrame.cancelBtnf;
    [self.cancelBtn setTitle:XZBCancleTitle forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor colorWithRed:89.0/255.0 green:196.0/255.0 blue:173.0/255.0 alpha:1] forState:UIControlStateNormal];
    self.statusLable.frame = myInfoFrame.statusLablef;
    self.statusLable.text = user.status;
    self.changeStatusBtn.frame = myInfoFrame.changeStatusBtnf;
    self.setBtn.frame = myInfoFrame.setBtnf;
    
    self.midBaseView.frame = myInfoFrame.midBaseViewf;
    self.faceView.frame = myInfoFrame.faceViewf;
    self.faceImageView.frame = myInfoFrame.faceImageViewf;
    self.faceImageView.image = [UIImage imageNamed:user.face_image_url];
    self.faceImageView.layer.masksToBounds = YES;
    self.faceImageView.layer.cornerRadius = self.faceImageView.frame.size.width / 2;
    
    self.nameLable.frame = myInfoFrame.nameLablef;
    self.nameLable.text = user.name;
    self.schoolLable.frame = myInfoFrame.schoolLablef;
    NSString *schoolString = [NSString stringWithFormat:@"%@|%@",user.city,user.school];
    self.schoolLable.text = schoolString;
    self.instituteLable.frame = myInfoFrame.instituteLablef;
    self.instituteLable.text = user.institute;
    self.attentionBtn.frame = myInfoFrame.attentionBtnf;
    NSString *attentionString = [NSString stringWithFormat:@"关注(%ld)",user.attentionNum];
    [self.attentionBtn setTitle:attentionString forState:UIControlStateNormal];
    self.fansBtn.frame = myInfoFrame.fansBtnf;
    NSString *fansString = [NSString stringWithFormat:@"粉丝(%ld)",user.fansNum];
    [self.fansBtn setTitle:fansString forState:UIControlStateNormal];
    
    self.centerToolBar.frame = myInfoFrame.centerToolBarf;
}
@end
