//
//  UIActionSheetAndAlertViewViewController.m
//  learnActionSheetAndAlertView
//
//  Created by tao on 16/7/18.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "UIActionSheetAndAlertViewViewController.h"

@interface UIActionSheetAndAlertViewViewController ()<UIActionSheetDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *showActionSheetButton;

@end

@implementation UIActionSheetAndAlertViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showActionSheetButton:(UIButton *)sender {
    //ios8.3  UIActionSheet is deprocated, Use UIAlertController whit preferredStyle UIAlertControllerStyleActionSheet
//    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:@"are you sure?" message:@"this is a UIAlertController" preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [actionSheetController addAction:cancelAction];
//    [actionSheetController addAction:okAction];
//    [self presentViewController:actionSheetController animated:YES completion:nil];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?"
                                                             delegate:self
                                                    cancelButtonTitle:@"No way"
                                               destructiveButtonTitle:@"Yes, I'm sure"
                                                    otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"上传照片" message:@"选择上传照片的选项" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"打开相册", @"打开摄像头", nil];
//        //alertViewStyle 除了默认还有plainTextInput 文本对话框;SecureTextInput 密码对话框;LoginAndPasswordInput 登陆对话框;
//        [alert setAlertViewStyle:UIAlertViewStyleSecureTextInput];
//        [alert show];
        
        //ios8.3  UIActionSheet is deprocated, Use UIAlertController whit preferredStyle UIAlertControllerStyleActionSheet
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"上传照片?" message:@"this is a UIAlertController" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"username";
            textField.secureTextEntry = NO;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"password";
            textField.secureTextEntry = YES;
            
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            UITextField *username = alertController.textFields.firstObject;
            UITextField *password = alertController.textFields.lastObject;
            if ([username.text isEqualToString:@"use"] && [password.text isEqualToString:@"1"]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登陆成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
                
            }
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
        }];
        okAction.enabled = NO;
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }
}

- (void)alertTextFieldDidChange:(NSNotification *)notification {
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        UITextField *username = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = username.text.length > 2;
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != 0) {
        
    }
}
@end
