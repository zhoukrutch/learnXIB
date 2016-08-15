//
//  rootViewController.m
//  learnNavigationController
//
//  Created by tao on 16/7/26.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) UIButton *go2NextViewButton;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.go2NextViewButton setTitle:@"Go to Second View" forState:UIControlStateNormal];
    //[self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    //self.title = @"Root View"; //设置navigation title
    //self.navigationController.hidesBarsOnTap = YES;
    //self.navigationController.hides
    [self.navigationController.navigationBar setTranslucent:NO]; //设置透明度
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]]; //设置颜色
    [self.navigationController.navigationBar setTintColor:[UIColor blueColor]];  //navigationItem color
    [self.navigationController setToolbarHidden:NO];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    self.editing = YES;

    [self.go2NextViewButton addTarget:self action:@selector(showSegueAction:)forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"im"]];
    [image setFrame:CGRectMake(100, 100, 100, 100)];
    image.layer.cornerRadius = 3.0;
    image.clipsToBounds = YES;
    [self.view addSubview:image];
    
}

- (void)showSegueAction:(id)sender {
    //SecondViewController *second = [[SecondViewController alloc] init];
    SecondViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    second.title = @"PushViewController";
    [second setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    //[self.navigationController pushViewController:second animated:YES];
    //[self.navigationController showViewController:second sender:sender];
    //[self showViewController:second sender:sender];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:second];
    [self presentViewController:nav animated:YES completion:nil];
}

//- (void)showSegueAction:(id)sender {
//    [self performSegueWithIdentifier:@"showSegue" sender:sender];
//}


- (IBAction)unwindForSegueToRootView:(UIStoryboardSegue *)segue{
    
}

- (UIButton *)go2NextViewButton {
    if (!_go2NextViewButton) {
        _go2NextViewButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
        [self.view addSubview:_go2NextViewButton];
        [self.go2NextViewButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _go2NextViewButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showSegue"]) {
        SecondViewController *second = (SecondViewController *)segue.destinationViewController;
        second.title = @"Show Segue";
        //[self.navigationController pushViewController:second animated:YES];
        //[second.nextViewButton setTitle:@"sec" forState:UIControlStateNormal];
    }
}


@end
