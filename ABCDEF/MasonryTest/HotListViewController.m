//
//  HotListViewController.m
//  ABCDEF
//
//  Created by 唐蒙波 on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "HotListViewController.h"
#import "HotListTableViewCell.h"

@interface HotListViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HotListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mainScrolView = [[UIScrollView alloc] init];
    self.mainScrolView.pagingEnabled = YES;
    [self.view addSubview:self.mainScrolView];
    

    self.mainTableView1 = [[UITableView alloc] init];
    self.mainTableView1.delegate = self;
    self.mainTableView1.dataSource = self;
    self.mainTableView1.estimatedRowHeight = 10;
    self.mainTableView1.rowHeight = UITableViewAutomaticDimension;
    [self.mainScrolView addSubview:self.mainTableView1];


    self.messageScrollView = [[UIScrollView alloc] init];
    self.messageScrollView.backgroundColor = [UIColor whiteColor];
    [self.mainScrolView addSubview:self.messageScrollView];

    [self.mainScrolView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(44);
        make.height.mas_equalTo(VIEW_HEIGHT-44);
        make.width.mas_equalTo(VIEW_WIDTH);
    }];


    [self.mainTableView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.height.mas_equalTo(self.mainScrolView.mas_height);
        make.width.mas_equalTo(VIEW_WIDTH);
    }];
    [self.messageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.mainTableView1.mas_right);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(self.mainScrolView.mas_height);
        make.width.mas_equalTo(VIEW_WIDTH);
        make.right.mas_equalTo(self.mainScrolView.mas_right);
    }];
    [self initMessageScrollView];
}
-(void)initMessageScrollView
{
    UILabel * titleLable = [[UILabel alloc] init];
    titleLable.font = [UIFont systemFontOfSize:30*BILI];
    titleLable.textColor = [UIColor blackColor];
    titleLable.text = @"我的";
    [self.messageScrollView addSubview:titleLable];
    
    UIImageView * heaerImageView = [[UIImageView alloc] init];
    heaerImageView.layer.masksToBounds = YES;
    heaerImageView.layer.cornerRadius = 30*BILI;
    heaerImageView.layer.borderWidth = 2*BILI;
    heaerImageView.layer.borderColor = [[UIColor blackColor] CGColor];
    heaerImageView.backgroundColor = [UIColor redColor];
    [self.messageScrollView addSubview:heaerImageView];
    
    UILabel * nickLable = [[UILabel alloc] init];
    nickLable.font = [UIFont systemFontOfSize:18*BILI];
    nickLable.textColor = [UIColor blackColor];
    nickLable.text = @"哇哈哈哈哈";
    [self.messageScrollView addSubview:nickLable];

    UILabel * idLable = [[UILabel alloc] init];
    idLable.font = [UIFont systemFontOfSize:14*BILI];
    idLable.textColor = [UIColor blackColor];
    idLable.text = @"ID:251973";
    [self.messageScrollView addSubview:idLable];
    
    
    UIImageView * qianBaoImageView = [[UIImageView alloc] init];
    qianBaoImageView.backgroundColor = [UIColor greenColor];
    [self.messageScrollView addSubview:qianBaoImageView];
    

    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(12*BILI);
        make.height.mas_equalTo(31*BILI);
        make.width.mas_equalTo(VIEW_WIDTH-24*BILI);
    }];
    
    [heaerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLable.mas_left);
        make.top.mas_equalTo(titleLable.mas_bottom).offset(24*BILI);
        make.size.mas_equalTo(CGSizeMake(60*BILI, 60*BILI));
    }];
    
    [nickLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(heaerImageView.mas_right).offset(12*BILI);
        make.top.mas_equalTo(heaerImageView.mas_top).offset(10*BILI);
        make.height.mas_equalTo(25*BILI);
    }];
    [idLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nickLable.mas_left);
        make.top.mas_equalTo(nickLable.mas_bottom);
        make.height.mas_equalTo(20*BILI);
    }];
    
    [qianBaoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12*BILI);
        make.top.mas_equalTo(heaerImageView.mas_bottom).offset(175*BILI/2);
        make.size.mas_equalTo(CGSizeMake(18*BILI, 18*BILI));
    }];
    
    UIView * lastView;
    for (int i =0; i < 4; i++){
        
        UIView *view =[[UIView new] init];
        view.backgroundColor = [UIColor greenColor];
        [self.messageScrollView addSubview:view];
        if (!lastView) {
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10*BILI);
                make.top.mas_equalTo(qianBaoImageView.mas_bottom).offset(10);
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
        }
        else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastView.mas_right).offset(10);
                make.top.mas_equalTo(qianBaoImageView.mas_bottom).offset(10);
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
        }
        lastView = view;
    }
    
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *tableIdentifier = [NSString stringWithFormat:@"HotListTableViewCell%d",(int)indexPath.row];
    HotListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil)
    {
        cell = [[HotListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
        [cell initUI:nil];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
