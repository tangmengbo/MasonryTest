//
//  ScrollMasonryViewController.m
//  KuaiLiao
//
//  Created by 唐蒙波 on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ScrollMasonryViewController.h"

@interface ScrollMasonryViewController ()

@end

@implementation ScrollMasonryViewController



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sourceArray.count;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *tableIdentifier = [NSString stringWithFormat:@"HomePageTableViewCell%d",(int)indexPath.row];
    TestMesoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil)
    {
        cell = [[TestMesoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
        [cell initUI:[self.sourceArray objectAtIndex:indexPath.row]];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.mainScrolView = [[UIScrollView alloc] init];
    self.mainScrolView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.mainScrolView];
    
    UILabel * contentLable = [[UILabel alloc] init];
    contentLable.font = [UIFont systemFontOfSize:14*BILI];
    contentLable.textColor = [UIColor blackColor];
    contentLable.numberOfLines = 0;
    [self.mainScrolView addSubview:contentLable];
    contentLable.text = @"奥斯卡机读卡机是大家圣诞节按时大大就看电视剧啊的撒打开的飒飒的";
    
    UIView * imageContentView = [[UIView alloc] init];
    [self.mainScrolView addSubview:imageContentView];
    int imageWidth = (VIEW_WIDTH-60*BILI)/3;
    int totalHeight = 0;
    for (int i=0; i<3; i++) {
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15*BILI+(imageWidth+15*BILI)*(i%3), (imageWidth+15*BILI)*(i/3), imageWidth, imageWidth)];
        imageView.backgroundColor = [UIColor blueColor];
        [imageContentView addSubview:imageView];
        
        totalHeight = imageView.frame.origin.y+imageView.frame.size.height;
    }
   
    self.contentLable2 = [[UILabel alloc] init];
    self.contentLable2.font = [UIFont systemFontOfSize:14*BILI];
    self.contentLable2.textColor = [UIColor blackColor];
    self.contentLable2.numberOfLines = 0;
    [self.mainScrolView addSubview:self.contentLable2];
    self.contentLable2.text = @"222奥斯卡机读卡机是大家圣诞节按时大大就看电视剧啊的撒打开的飒飒的奥斯卡机读卡机是大家圣诞节按时大大就看电视剧啊的撒打开的飒飒的奥斯卡机读卡机是大家圣诞节按时大大就看电视剧啊的撒打开的飒飒的奥斯卡机读卡机是大家圣诞节按时大大就看电视剧啊的撒打开的飒飒的";
   
    self.contentScrollView = [[UIScrollView alloc] init];
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
    self.contentScrollView.tag = 1001;
    [self.mainScrolView addSubview:self.contentScrollView];
    

    [self.mainScrolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(44);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(VIEW_WIDTH);
        make.height.mas_equalTo(VIEW_HEIGHT-44);
    }];
    
   
    [contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.view.mas_leading).offset(15*BILI);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-15*BILI);
        make.top.mas_equalTo(self.mainScrolView.mas_top).offset(10*BILI);
        
    }];
    
    [imageContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
        make.height.mas_equalTo(totalHeight);
        make.top.mas_equalTo(contentLable.mas_bottom).offset(10*BILI);
        
    }];
   
    [self.contentLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.view.mas_leading).offset(15*BILI);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-15*BILI);
        make.top.mas_equalTo(imageContentView.mas_bottom).offset(10*BILI);
    }];
   
    [self.contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentLable2.mas_bottom).offset(10*BILI);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(VIEW_WIDTH);
        make.bottom.mas_equalTo(self.mainScrolView.mas_bottom);
    }];


    [self initContentScrollview];
    [self initMessageScrollview];

}
-(void)initMessageScrollview
{
    NSDictionary * info = [[NSDictionary alloc] initWithObjectsAndKeys:@"15",@"countStr", nil];

    self.imageViewContentView = [[UIView alloc] init];
    self.imageViewContentView.backgroundColor = [UIColor greenColor];
    [self.contentScrollView addSubview:self.imageViewContentView];

    int imageWidth = (VIEW_WIDTH-60*BILI)/3;
    imageContentHeight = 0;

    NSString * countStr = [info objectForKey:@"countStr"];
    for (int i=0; i<countStr.intValue; i++) {

        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15*BILI+(imageWidth+15*BILI)*(i%3), (imageWidth+15*BILI)*(i/3), imageWidth, imageWidth)];
        imageView.backgroundColor = [UIColor blueColor];
        [self.imageViewContentView addSubview:imageView];

        imageContentHeight = imageView.frame.origin.y+imageView.frame.size.height;
    }
    [self.imageViewContentView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.mainTableView.mas_right);
        make.width.mas_equalTo(VIEW_WIDTH);
        make.height.mas_equalTo(self->imageContentHeight);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(self.contentScrollView.mas_right);
        //  make.bottom.mas_equalTo(self.contentScrollView.mas_bottom);不能添加这句代码,否则scroll滚动后更新约束会有问题

    }];
}
-(void)initContentScrollview
{
    NSDictionary * info = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"5",@"countStr", nil];
    NSDictionary * info1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大那仨大所那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"9",@"countStr", nil];
    NSDictionary * info2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大大师大所大所大那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"4",@"countStr", nil];
    NSDictionary * info3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大",@"contentStr",@"3",@"countStr", nil];
//    NSDictionary * info4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"7",@"countStr", nil];
    self.sourceArray = [[NSArray alloc] initWithObjects:info,info1,info2,info3,nil];
    
    
    
    self.mainTableView = [[UITableView alloc] init];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.estimatedRowHeight = 10;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
    [self.contentScrollView addSubview:self.mainTableView];
    self.mainTableView.scrollEnabled = NO;
    
    [self setTableViewHeader];
    tableViewHeight = [self getTableViewHeight:self.sourceArray]+headerHeight;

    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(VIEW_WIDTH);
        make.height.mas_equalTo(self->tableViewHeight);
//        make.bottom.mas_equalTo(self.contentScrollView.mas_bottom);不能添加这句代码,否则scroll滚动后更新约束会有问题
    }];
    [self.contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->tableViewHeight);
    }];
}
-(void)setTableViewHeader
{
    UIView *headView = [[UIView alloc] init];
    
    UILabel * contentLable = [[UILabel alloc] init];
    contentLable.font = [UIFont systemFontOfSize:14*BILI];
    contentLable.textColor = [UIColor blackColor];
    contentLable.numberOfLines = 0;
    [headView addSubview:contentLable];
    contentLable.text = @"奥斯卡机读卡机是大家圣诞节按时大大就看电视剧啊的撒打开的飒飒的";
    
    [contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(headView).mas_offset(5);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(VIEW_WIDTH/2);
    }];
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor purpleColor];
    [headView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headView);
        make.top.equalTo(contentLable.mas_bottom);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(headView);
    }];
    
    CGFloat height = [headView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = headView.bounds;
    frame.size.height = height;
    headView.frame = frame;
    [self.mainTableView setTableHeaderView:headView];
    
    headerHeight = headView.frame.size.height;
}
-(float)getTableViewHeight:(NSArray *)sourceArray
{
    float height = 0;
    for (NSDictionary * info in sourceArray) {
        
        UIView * contentView = [[UIView alloc] init];
        [self.view addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-VIEW_WIDTH*10);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(VIEW_WIDTH);
        }];

        UILabel * contentLable = [[UILabel alloc] init];
        contentLable.font = [UIFont systemFontOfSize:14*BILI];
        contentLable.textColor = [UIColor blackColor];
        contentLable.numberOfLines = 0;
        [contentView addSubview:contentLable];
        [contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.mas_equalTo(contentView.mas_leading).offset(15*BILI);
            make.trailing.mas_equalTo(contentView.mas_trailing).offset(-15*BILI);
            make.top.mas_equalTo(contentView.mas_top).offset(10*BILI);
            
        }];
        contentLable.text = [info objectForKey:@"contentStr"];
        
        UIView * imageContentView = [[UIView alloc] init];
        [contentView addSubview:imageContentView];
        
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
            
            make.leading.mas_equalTo(contentView.mas_leading).offset(0);
            make.trailing.mas_equalTo(contentView.mas_trailing).offset(0);
            make.height.mas_equalTo(totalHeight);
            make.top.mas_equalTo(contentLable.mas_bottom).offset(10*BILI);
            make.bottom.mas_equalTo(contentView.mas_bottom).offset(-10*BILI);
            
        }];
        [contentView layoutIfNeeded];//获取cell的高度这句代码必须添加
        height = height+contentView.frame.size.height;
        [contentView removeFromSuperview];
    }
    return height;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.tag==1001)
    {
        int  specialIndex = scrollView.contentOffset.x/VIEW_WIDTH;
        
        if (specialIndex==0) {
            
            [self.contentScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(self->tableViewHeight);
            }];
        }
        else
        {

            [self.contentScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(self->imageContentHeight);
            }];
        }
    }


}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
