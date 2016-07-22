//
//  ClotherTableViewCell.m
//  ClotherPriceList_tableView
//
//  Created by tao on 16/7/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "ClotherTableViewCell.h"

@interface ClotherTableViewCell()

@end

@implementation ClotherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setImageView:(NSString *)imageName{
    if (imageName) {
        [_clotherImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", imageName]]];
    }
}

- (void)setTitle:(NSString *)title{
    if(title){
        [_titleLabel setText:title];
    }
}

- (void)setDetailInfo:(NSString *)detail{
    if(detail){
        [_detailLabel setText:detail];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
