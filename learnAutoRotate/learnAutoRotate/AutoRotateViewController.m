//
//  AutoRotateViewController.m
//  learnAutoRotate
//
//  Created by tao on 16/7/18.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "AutoRotateViewController.h"

@interface AutoRotateViewController ()
@property (strong, nonatomic) UIButton *button_1;
@property (strong, nonatomic) UIButton *button_2;

@end

@implementation AutoRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button_1.backgroundColor = [UIColor clearColor];
    self.button_2.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
}
- (UIButton *)button_1 {
    if (!_button_1) {
        _button_1 = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 75, 20)];
        [_button_1 setTitle:@"button" forState:UIControlStateNormal];
        [_button_1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [self.view addSubview:_button_1];
    return _button_1;
}

- (UIButton *)button_2 {
    if (!_button_2) {
        _button_2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 547, 75, 20)];
        [_button_2 setTitle:@"button2" forState:UIControlStateNormal];
        [_button_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
    }
    [self.view addSubview:_button_2];
    return _button_2;
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        [self.button_1 setFrame:CGRectMake(150, 100, 75, 20)];
        [self.button_2 setFrame:CGRectMake(150, 547, 75, 20)];
    } else {
        [self.button_1 setFrame:CGRectMake(300, 100, 67, 75)];
        [self.button_2 setFrame:CGRectMake(300, 225, 67, 75)];
    }
}

@end
