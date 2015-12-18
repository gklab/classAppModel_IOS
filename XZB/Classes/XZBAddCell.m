//
//  XZBAddCell.m
//  XZB
//
//  Created by 王兆凯 on 15/9/1.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBAddCell.h"
@interface XZBAddCell()
@property (nonatomic,weak) UIView *baseView;
@property (nonatomic,weak) UILabel *cityLable;
@property (nonatomic,weak) UILabel *schoolLable;
@property (nonatomic,weak) UILabel *instituteLable;
@property (nonatomic,weak) UILabel *line1;
@property (nonatomic,weak) UILabel *line2;
@end
@implementation XZBAddCell
+ (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"add";
    XZBAddCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[XZBAddCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
        baseView.layer.cornerRadius = 10;
        baseView.layer.masksToBounds = YES;
        self.baseView = baseView;
        [self.contentView addSubview:baseView];
        
        UILabel *cityLable = [[UILabel alloc] init];
        [self.baseView addSubview:cityLable];
        self.cityLable = cityLable;
        
        UILabel *schoolLable = [[UILabel alloc] init];
        [self.baseView addSubview:schoolLable];
        self.schoolLable = schoolLable;
        
        UILabel *instituteLable = [[UILabel alloc] init];
        [self.baseView addSubview:instituteLable];
        self.instituteLable = instituteLable;
        
        UIImageView *rightImageView = [[UIImageView alloc] init];
        rightImageView.image = [UIImage imageNamed:@"大圈主"];
        rightImageView.hidden = YES;
        [self.baseView addSubview:rightImageView];
        self.rightImageView = rightImageView;
        
        UILabel *line1 = [[UILabel alloc] init];
        UIColor *lineColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
        line1.backgroundColor = lineColor;
        [self.baseView addSubview:line1];
        self.line1 = line1;
        
        UILabel *line2 = [[UILabel alloc] init];
        line2.backgroundColor = lineColor;
        [self.baseView addSubview:line2];
        self.line2 = line2;
    }
    return self;
}

-(void)setAddCellFrame:(XZBAddCellFrame *)addCellFrame
{
    _addCellFrame = addCellFrame;
    CGFloat lineH = 14;
    
    self.baseView.frame = addCellFrame.baseViewf;
    self.baseView.backgroundColor = [UIColor whiteColor];
    self.cityLable.frame = addCellFrame.cityLablef;
    self.cityLable.text = addCellFrame.selectCircle.city;
    self.cityLable.font = XZBAddCellFont;
    
    self.line1.frame = CGRectMake(CGRectGetMaxX(self.cityLable.frame) + 1, (addCellH - lineH)/2, 1, lineH);
    
    self.schoolLable.frame = addCellFrame.schoolLablef;
    self.schoolLable.text = addCellFrame.selectCircle.school;
    self.schoolLable.font = XZBAddCellFont;
    
    self.line2.frame = CGRectMake(CGRectGetMaxX(self.schoolLable.frame) + 1, (addCellH - lineH)/2, 1, lineH);
    
    self.instituteLable.frame = addCellFrame.instituteLablef;
    self.instituteLable.text = addCellFrame.selectCircle.institute;
    self.instituteLable.font = XZBAddCellFont;
    
    self.rightImageView.frame = addCellFrame.rightImageViewf;
}
@end
