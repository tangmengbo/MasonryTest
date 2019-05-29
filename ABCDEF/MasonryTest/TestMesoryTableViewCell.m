//
//  TestMesoryTableViewCell.m
//  KuaiLiao
//
//  Created by 唐蒙波 on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TestMesoryTableViewCell.h"
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height
#define BILI [UIScreen mainScreen].bounds.size.width/375
@implementation TestMesoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}
-(void)initUI:(NSDictionary *)info
{
   // [self removeAllSubviews];
    UILabel * contentLable = [[UILabel alloc] init];
    contentLable.font = [UIFont systemFontOfSize:14*BILI];
    contentLable.textColor = [UIColor blackColor];
    contentLable.numberOfLines = 0;
    [self.contentView addSubview:contentLable];
    [contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.contentView.mas_leading).offset(15*BILI);
        make.trailing.mas_equalTo(self.contentView.mas_trailing).offset(-15*BILI);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10*BILI);
        
    }];
    contentLable.text = [info objectForKey:@"contentStr"];
    
    UIView * imageContentView = [[UIView alloc] init];
    [self.contentView addSubview:imageContentView];

    int imageWidth = (VIEW_WIDTH-60*BILI)/3;
    int totalHeight = 0;
    NSString * countStr = [info objectForKey:@"countStr"];
    for (int i=0; i<countStr.intValue; i++) {

        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15*BILI+(imageWidth+15*BILI)*(i%3), (imageWidth+15*BILI)*(i/3), imageWidth, imageWidth)];
        imageView.backgroundColor = [UIColor blueColor];
        [imageContentView addSubview:imageView];

        totalHeight = imageView.frame.origin.y+imageView.frame.size.height;
    }

    [imageContentView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.mas_equalTo(self.contentView.mas_leading).offset(0);
        make.trailing.mas_equalTo(self.contentView.mas_trailing).offset(0);
        make.height.mas_equalTo(totalHeight);
        make.top.mas_equalTo(contentLable.mas_bottom).offset(10*BILI);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10*BILI);

    }];
     [self.contentView layoutIfNeeded];
}
@end
