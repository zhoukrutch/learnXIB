//
//  ClotherPriceListViewController.h
//  ClotherPriceList_tableView
//
//  Created by tao on 16/7/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Clother : NSObject

@property (strong, nonatomic) NSString *brandName;
@property (strong, nonatomic) NSString *clotherImage;
@property (strong, nonatomic) NSString *clotherPrice;

@end

@interface ClotherPriceListViewController : UIViewController

@end
