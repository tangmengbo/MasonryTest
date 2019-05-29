//
//  HotListViewController.h
//  ABCDEF
//
//  Created by 唐蒙波 on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height
#define BILI [UIScreen mainScreen].bounds.size.width/375


NS_ASSUME_NONNULL_BEGIN

@interface HotListViewController : UIViewController
@property(nonatomic,strong)UIScrollView * mainScrolView;
@property(nonatomic,strong)UITableView * mainTableView1;
@property(nonatomic,strong)UIScrollView * messageScrollView;
@end

NS_ASSUME_NONNULL_END
