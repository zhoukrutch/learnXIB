//
//  TextFieldViewController.m
//  learnUITextField
//
//  Created by tao on 16/7/15.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController () <UITextFieldDelegate>

@property (strong,nonatomic) UITextField * user;

@property (strong,nonatomic) UITextField * password;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user.text = @"默认文字";
    self.user.secureTextEntry= NO;
    // Do any additional setup after loading the view.
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    image.image = [UIImage imageNamed:@"tally_Bg"];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    self.user.rightView = image;
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITextField *)user{
    if (!_user) {
        _user = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
    }
    [_user setBorderStyle:UITextBorderStyleNone];
    _user.backgroundColor = [UIColor clearColor];          //只有borderstyle设置成none  背景属性才能生效
    _user.background = [UIImage imageNamed:@"tally_Bg"];
    _user.placeholder = @"username";
    _user.font = [UIFont systemFontOfSize:12.0f];
    _user.textColor = [UIColor blueColor];
    [_user setClearButtonMode:UITextFieldViewModeAlways];
    [_user setAutocorrectionType:UITextAutocorrectionTypeNo];
    _user.clearsOnBeginEditing = YES;
    [_user setTextAlignment:NSTextAlignmentCenter];
    _user.minimumFontSize = 12;
    
    
    
    
    _user.delegate = self;
    
    
    [self.view addSubview:_user];
    return _user;
}


#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_user resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [_user becomeFirstResponder];
}

@end
