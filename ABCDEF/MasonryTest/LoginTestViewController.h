//
//  LoginTestViewController.h
//  KuaiLiao
//
//  Created by 唐蒙波 on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestMesoryTableViewCell.h"
#import "ScrollMasonryViewController.h"
#import "HotListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginTestViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * mainTableView;
@property(nonatomic,strong)NSArray * sourceArray;

@end

NS_ASSUME_NONNULL_END
