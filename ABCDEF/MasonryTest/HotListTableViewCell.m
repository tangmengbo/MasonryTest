//
//  HotListTableViewCell.m
//  ABCDEF
//
//  Created by 唐蒙波 on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "HotListTableViewCell.h"

@implementation HotListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}
-(void)initUI:(NSDictionary *)info1
{
    
    // [self removeAllSubviews];
    UIView * contentView1 = [[UIView alloc] init];
    [self.contentView addSubview:contentView1];
    
    UIImageView * headerImageView1 = [[UIImageView alloc] init];
    headerImageView1.backgroundColor = [UIColor redColor];
    [contentView1 addSubview:headerImageView1];
    
    UILabel * nameLable1 = [[UILabel alloc] init];
    nameLable1.font = [UIFont systemFontOfSize:15*BILI];
    nameLable1.textColor = [UIColor blackColor];
    nameLable1.text = @"我的的借口上厕所";
    [contentView1 addSubview:nameLable1];
    
    UIImageView * sexImageView1 = [[UIImageView alloc] init];
    sexImageView1.backgroundColor = [UIColor greenColor];
    [contentView1 addSubview:sexImageView1];
    
    UILabel * ageLable1 = [[UILabel alloc] init];
    ageLable1.font = [UIFont systemFontOfSize:12*BILI];
    ageLable1.textColor = [UIColor blackColor];
    ageLable1.text = @"24";
    [contentView1 addSubview:ageLable1];
    
    UILabel * messageLable1 = [[UILabel alloc] init];
    messageLable1.font = [UIFont systemFontOfSize:12*BILI];
    messageLable1.textColor = [UIColor blackColor];
    messageLable1.alpha = 0.5;
    messageLable1.numberOfLines = 0;
    messageLable1.text = @"撒大声地静安寺都很纠结啊圣诞节暗红色的骄傲和圣诞节啊";
    [contentView1 addSubview:messageLable1];
    
    [contentView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(6*BILI);
        make.width.mas_equalTo(180*BILI);
        make.top.mas_equalTo(0);
    }];
    [headerImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(contentView1.mas_width);
        make.height.mas_equalTo(210*BILI);
    }];
    [nameLable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(headerImageView1.mas_bottom).offset(5*BILI);
        make.width.mas_lessThanOrEqualTo(105*BILI);
        make.height.mas_equalTo(15*BILI);
    }];
    [sexImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLable1.mas_right).offset(5*BILI);
        make.top.mas_equalTo(nameLable1.mas_top).offset(1.5*BILI);
        make.size.mas_equalTo(CGSizeMake(12*BILI, 12*BILI));
    }];
    [ageLable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sexImageView1.mas_right).offset(5*BILI);
        make.top.mas_equalTo(nameLable1.mas_top);
        make.width.mas_lessThanOrEqualTo(30*BILI);
        make.height.mas_equalTo(nameLable1.mas_height);
    }];
    
    [messageLable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headerImageView1.mas_left);
        make.top.mas_equalTo(nameLable1.mas_bottom).offset(7*BILI);
        make.width.mas_equalTo(headerImageView1.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-8*BILI);
    }];
   //******************************************************************
    
    UIView * contentView2 = [[UIView alloc] init];
    [self.contentView addSubview:contentView2];

    UIImageView * headerImageView2 = [[UIImageView alloc] init];
    headerImageView2.backgroundColor = [UIColor redColor];
    [contentView2 addSubview:headerImageView2];
    
    UILabel * nameLable2 = [[UILabel alloc] init];
    nameLable2.font = [UIFont systemFontOfSize:15*BILI];
    nameLable2.textColor = [UIColor blackColor];
    nameLable2.text = @"我的的借";
    [contentView2 addSubview:nameLable2];
    
    UIImageView * sexImageView2 = [[UIImageView alloc] init];
    sexImageView2.backgroundColor = [UIColor greenColor];
    [contentView2 addSubview:sexImageView2];
    
    UILabel * ageLable2 = [[UILabel alloc] init];
    ageLable2.font = [UIFont systemFontOfSize:12*BILI];
    ageLable2.textColor = [UIColor blackColor];
    ageLable2.text = @"24";
    [contentView2 addSubview:ageLable2];
    
    UILabel * messageLable2 = [[UILabel alloc] init];
    messageLable2.font = [UIFont systemFontOfSize:12*BILI];
    messageLable2.textColor = [UIColor blackColor];
    messageLable2.alpha = 0.5;
    messageLable2.numberOfLines = 0;
    messageLable2.text = @"撒大声地静安寺都很纠";
    [contentView2 addSubview:messageLable2];
    
    [contentView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(contentView1.mas_right).offset(3*BILI);
        make.width.mas_equalTo(180*BILI);
        make.top.mas_equalTo(0);
    }];
    [headerImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(contentView2.mas_width);
        make.height.mas_equalTo(210*BILI);
    }];
    [nameLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(headerImageView2.mas_bottom).offset(5*BILI);
        make.width.mas_lessThanOrEqualTo(105*BILI);
        make.height.mas_equalTo(15*BILI);
    }];
    [sexImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLable2.mas_right).offset(5*BILI);
        make.top.mas_equalTo(nameLable2.mas_top).offset(1.5*BILI);
        make.size.mas_equalTo(CGSizeMake(12*BILI, 12*BILI));
    }];
    [ageLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sexImageView2.mas_right).offset(5*BILI);
        make.top.mas_equalTo(nameLable2.mas_top);
        make.width.mas_lessThanOrEqualTo(30*BILI);
        make.height.mas_equalTo(nameLable2.mas_height);
    }];
    
    [messageLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headerImageView2.mas_left);
        make.top.mas_equalTo(nameLable2.mas_bottom).offset(7*BILI);
        make.width.mas_equalTo(headerImageView2.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-8*BILI);
    }];
    
    [self.contentView layoutIfNeeded];
}
@end
