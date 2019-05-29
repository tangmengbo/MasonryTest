//
//  TestMesoryTableViewCell.h
//  KuaiLiao
//
//  Created by 唐蒙波 on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestMesoryTableViewCell : UITableViewCell

@property(nonatomic,strong)NSDictionary * info;
-(void)initUI:(NSDictionary *)info;
@end

NS_ASSUME_NONNULL_END
