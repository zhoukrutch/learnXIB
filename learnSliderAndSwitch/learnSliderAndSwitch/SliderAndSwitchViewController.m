//
//  SliderAndSwitchViewController.m
//  learnSliderAndSwitch
//
//  Created by tao on 16/7/15.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "SliderAndSwitchViewController.h"

@interface SliderAndSwitchViewController ()
@property (strong, nonatomic) UISlider *sliderView;
@property (strong, nonatomic) UISwitch *switchView;
@property (strong, nonatomic) UILabel *sliderLabel;
@property (strong, nonatomic) UILabel *switchLabel;

@end

@implementation SliderAndSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sliderView addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    self.sliderLabel.backgroundColor = [UIColor clearColor];
    self.switchLabel.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
}

- (UILabel *)sliderLabel{
    if (!_sliderLabel) {
        _sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 30, 30)];
        self.sliderLabel.text = @"0";
    }
    [self.view addSubview:_sliderLabel];
    return _sliderLabel;
}

- (UISlider *)sliderView{
    if(!_sliderView){
        _sliderView = [[UISlider alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    }
    _sliderView.minimumValue = 0;
    _sliderView.maximumValue = 100;
    _sliderView.value = (_sliderView.minimumValue + _sliderView.maximumValue) / 2;
    _sliderView.continuous = YES;  //设置成no  只有在滑动结束后才会生效
    [_sliderView setThumbImage:[UIImage imageNamed:@"gold"] forState:UIControlStateNormal];
    [self.view addSubview:_sliderView];
    return _sliderView;
}

- (UILabel *)switchLabel{
    if (!_switchLabel) {
        _switchLabel = [[UILabel alloc] initWithFrame:CGRectMake(50 , 200, 30, 30)];
        _switchLabel.text = @"no";
    }
    [self.view addSubview:_switchLabel];
    return _switchLabel;
}

- (UISwitch *)switchView{
    if (!_switchView) {
        _switchView = [[UISwitch alloc] initWithFrame:CGRectMake(100, 200, 50, 30)];
    }
    [self.view addSubview:_switchView];
    return _switchView;
}

- (void)switchAction:(id)sender {
    UISwitch *switchButton = (UISwitch *)sender;
    BOOL isButtonOn = switchButton.on;
    if (isButtonOn) {
        self.switchLabel.text = @"yes";
    }else{
        self.switchLabel.text = @"no";
    }
}



- (void)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)roundf(slider.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%i",progressAsInt];
}

@end
