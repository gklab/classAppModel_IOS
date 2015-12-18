//
//  XZBBaseCell.m
//  XZB
//
//  Created by 王兆凯 on 15/8/31.
//  Copyright (c) 2015年 alhelp. All rights reserved.
//

#import "XZBBaseCell.h"
#import "XZBBaseCellInfo.h"
@interface XZBBaseCell()
@property (nonatomic,strong) NSMutableArray *baseViewArray;
@property (nonatomic,weak) UIView *baseView;
@end
@implementation XZBBaseCell
+ (instancetype)initWithTableView:(UITableView *)tableView btnNum:(NSUInteger)num
{
    static NSString *ID = @"base";
    XZBBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[XZBBaseCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID btnNum:num];
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
-(void)setBaseCellFrame:(XZBBaseCellFrame *)baseCellFrame
{
    self.baseView.frame = baseCellFrame.baseViewf;
    NSUInteger count= self.baseViewArray.count;
    for(int i = 0 ; i < count ; i++)
    {
        NSValue *v = baseCellFrame.baseCellBtnsf[i];
        UIView *cellBase = self.baseViewArray[i];
        NSArray *cell=[cellBase subviews];
        UIImageView *cellSubmageView = cell[0];
        UILabel *cellSubLabel = cell[1];
        UIImageView *cellRightIcon = cell[2];
        XZBBaseCellInfo *info = baseCellFrame.baseCellInfos[i];
        
        cellSubmageView.image = [UIImage imageNamed:info.icon_url];
        cellSubmageView.frame = baseCellFrame.iconImageViewf;
        cellSubLabel.text = info.title;
        cellSubLabel.font = XZBBaseCellMaxFont;
        cellSubLabel.frame = baseCellFrame.titleLablef;
        cellRightIcon.image = [UIImage imageNamed:@"大圈主"];
        cellRightIcon.frame = baseCellFrame.rightIcon;
        cellBase.frame = [v CGRectValue];
        cellBase.backgroundColor = [UIColor whiteColor];
    }
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier btnNum:(NSUInteger)num
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    if(self)
    {
        UIView *baseView = [[UIView alloc] init];
        self.baseView = baseView;
        [self.contentView addSubview:baseView];
        for(int i = 0;i < num;i++)
        {
            [self insertBaseViewArray];
        }
    }
    return self;
}
-(NSMutableArray *)baseViewArray
{
    if(!_baseViewArray)
    {
        _baseViewArray = [[NSMutableArray alloc] init];
    }
    return _baseViewArray;
}
-(void)insertBaseViewArray
{
    UIView *cellBase = [[UIView alloc] init];
    UIImageView *iconImageView = [[UIImageView alloc] init];
    UILabel *titleLable = [[UILabel alloc] init];
    UIImageView *rightIcon = [[UIImageView alloc] init];
    [cellBase addSubview:iconImageView];
    [cellBase addSubview:titleLable];
    [cellBase addSubview:rightIcon];
    [self.baseView addSubview:cellBase];
    [self.baseViewArray addObject:cellBase];
    
}

@end
