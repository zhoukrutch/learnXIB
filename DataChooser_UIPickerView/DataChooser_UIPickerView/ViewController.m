//
//  ViewController.m
//  DataChooser_UIPickerView
//
//  Created by tao on 16/7/21.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *areaArr;
    NSMutableArray *teamArr;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    areaArr = @[@"西南赛区", @"中央区", @"东南区", @"大西洋区", @"西北区", @"太平洋区"];
    teamArr = [[NSMutableArray alloc] init];
    [teamArr addObject:@[@"马刺", @"灰熊", @"小牛", @"火箭", @"鹈鹕"]];
    [teamArr addObject:@[@"活塞", @"步行者", @"骑士", @"公牛", @"雄鹿"]];
    [teamArr addObject:@[@"热火", @"魔术", @"老鹰", @"奇才", @"黄蜂"]];
    [teamArr addObject:@[@"卡尔特人", @"76人", @"尼克斯", @"篮网", @"猛龙"]];
    [teamArr addObject:@[@"森林狼", @"掘金", @"爵士", @"开拓者", @"雷霆"]];
    [teamArr addObject:@[@"国王", @"太阳", @"湖人", @"快船", @"勇士"]];
    self.pickView.delegate = self;
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [areaArr count];
    }else{
        NSInteger currentRow = [pickerView selectedRowInComponent:0];
        return [teamArr[currentRow] count];
    }
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return areaArr[row];
    }else{
        NSInteger currentRow = [pickerView selectedRowInComponent:0];
        return teamArr[currentRow][row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [pickerView reloadComponent:1];
    NSInteger areaRow = [pickerView selectedRowInComponent:0];
    NSInteger teamRow = [pickerView selectedRowInComponent:1];
    [self.textField setText:[NSString stringWithFormat:@"%@-%@",areaArr[areaRow],teamArr[areaRow][teamRow]]];
}

@end
