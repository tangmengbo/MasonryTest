//
//  LoginTestViewController.m
//  KuaiLiao
//
//  Created by 唐蒙波 on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LoginTestViewController.h"
#import "Masonry.h"
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height
#define BILI [UIScreen mainScreen].bounds.size.width/375
@interface LoginTestViewController ()

@end

@implementation LoginTestViewController

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
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

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        ScrollMasonryViewController * vc = [[ScrollMasonryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

    }
    else
    {
        HotListViewController * vc = [[HotListViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary * info = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"5",@"countStr", nil];
    NSDictionary * info1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大那仨大所那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"9",@"countStr", nil];
    NSDictionary * info2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大大师大所大所大那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"4",@"countStr", nil];
    NSDictionary * info3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大大所大所多奥术大师大所大所大那仨大所大所大所多奥术大师大所大所大那仨大所大",@"contentStr",@"3",@"countStr", nil];
    NSDictionary * info4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"那仨大所大所大所多奥术大师大所大所大",@"contentStr",@"7",@"countStr", nil];
    self.sourceArray = [[NSArray alloc] initWithObjects:info,info1,info2,info3,info4,nil];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, VIEW_WIDTH, VIEW_HEIGHT-44)];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.estimatedRowHeight = 10;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.mainTableView];
    
}
-(void)initLoginViewLeft
{
    self.view.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;

    UIImageView * logoImageView = [[UIImageView alloc] init];
    logoImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:logoImageView];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100*BILI, 100*BILI));
        make.width.mas_equalTo(100*BILI);
        make.height.mas_equalTo(100*BILI);
        make.top.mas_equalTo(self.view.mas_top).offset(200*BILI);
        
    }];
    
    UIButton * accountBottomView = [[UIButton alloc] init];
    accountBottomView.layer.borderWidth = 1;
    accountBottomView.layer.cornerRadius = 25*BILI;
    accountBottomView.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview:accountBottomView];
    
    [accountBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view.mas_leading).offset(55*BILI/2);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-55*BILI/2);
        make.top.mas_equalTo(self.view.mas_top).offset(700*BILI/2);
        make.height.mas_equalTo(50*BILI);
    }];
    
    UIImageView * accountImageView = [[UIImageView alloc] init];
    accountImageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:accountImageView];
    [accountImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(accountBottomView.mas_leading).offset(20*BILI);
        make.bottom.mas_equalTo(accountBottomView.mas_bottom).offset(-13*BILI);
        make.top.mas_equalTo(accountBottomView.mas_top).offset(13*BILI);
        make.width.mas_equalTo(24*BILI);
        
    }];
    
    UITextField * acconutTextField = [[UITextField alloc] init];
    acconutTextField.font = [UIFont systemFontOfSize:14*BILI];
    acconutTextField.textColor = [UIColor blackColor];
    acconutTextField.placeholder = @"请输入账号";
    [self.view addSubview:acconutTextField];
    [acconutTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(accountImageView.mas_trailing).offset(10*BILI);
        make.bottom.mas_equalTo(accountBottomView.mas_bottom).offset(0);
        make.top.mas_equalTo(accountBottomView.mas_top);
        make.width.mas_equalTo(140*BILI);
        
        
    }];
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
