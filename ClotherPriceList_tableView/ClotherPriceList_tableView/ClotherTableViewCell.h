//
//  ClotherTableViewCell.h
//  ClotherPriceList_tableView
//
//  Created by tao on 16/7/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClotherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *clotherImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


- (void)setImageView:(NSString *)imageName;
- (void)setTitle:(NSString *)title;
- (void)setDetailInfo:(NSString *)detail;


@end
