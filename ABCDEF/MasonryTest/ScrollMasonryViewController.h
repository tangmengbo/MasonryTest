//
//  ScrollMasonryViewController.h
//  KuaiLiao
//
//  Created by 唐蒙波 on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestMesoryTableViewCell.h"
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height
#define BILI [UIScreen mainScreen].bounds.size.width/375
NS_ASSUME_NONNULL_BEGIN

@interface ScrollMasonryViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    float imageContentHeight;
    float tableViewHeight;
    float headerHeight;
}

@property(nonatomic,strong)UIScrollView * mainScrolView;
@property(nonatomic,strong)UIScrollView * contentScrollView;

@property(nonatomic,strong)UILabel * contentLable2;

@property(nonatomic,strong)UITableView * mainTableView;
@property(nonatomic,strong)NSArray * sourceArray;

@property(nonatomic,strong)UIView * imageViewContentView;

@end

NS_ASSUME_NONNULL_END
