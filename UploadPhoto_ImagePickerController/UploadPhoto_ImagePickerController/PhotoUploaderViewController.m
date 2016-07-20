//
//  PhotoUploaderViewController.m
//  UploadPhoto_ImagePickerController
//
//  Created by tao on 16/7/20.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "PhotoUploaderViewController.h"

@interface PhotoUploaderViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation PhotoUploaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    // Do any additional setup after loading the view.
}

- (IBAction)uploadPhotoAction:(id)sender {
    UIImagePickerController *pickControl = [[UIImagePickerController alloc] init];
    [pickControl setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    pickControl.delegate = self;
    [pickControl setAllowsEditing:YES];
    [self presentViewController:pickControl animated:NO completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //UIImagePickerControllerOriginalImage 
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    [self.imageView setImage:image];
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
