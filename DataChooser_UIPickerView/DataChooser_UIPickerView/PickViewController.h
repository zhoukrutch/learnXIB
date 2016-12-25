//
//  PickViewController.h
//  DataChooser_UIPickerView
//
//  Created by tao on 16/8/25.
//  Copyright © 2016年 tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol setNSStringDelegate <NSObject>

- (void)setNSString:(NSString *)first secondNSString:(NSString *)second;

@end

@interface PickViewController : UIViewController

@property (nonatomic, strong) id<setNSStringDelegate> pickDelegate;

@end
