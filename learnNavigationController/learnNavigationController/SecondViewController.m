//
//  SecondViewController.m
//  learnNavigationController
//
//  Created by tao on 16/7/26.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "SecondViewController.h"
#import "RootViewController.h"
#import "NavgationPopAnimator.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate>
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *perecentDrivenInteractive;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.nextViewButton setTitle:@"Go to Second View" forState:UIControlStateNormal];
    //self.title = @"Second View"; //设置navigation title

    // Do any additional setup after loading the view.
}


- (IBAction)goBackByUnwindSegue:(UIButton *)sender {
    //[self.presentingViewController.presentedViewController performSegueWithIdentifier:@"showUnwind" sender:sender];
    [self performSegueWithIdentifier:@"showRoot" sender:sender];
}
- (IBAction)dismissVCAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setNewVCsAction:(id)sender {
    RootViewController *root = [self.storyboard instantiateViewControllerWithIdentifier:@"RootViewController"];
    //SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController setViewControllers:@[root,self] animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)nextViewButton {
    if (!_nextViewButton) {
        _nextViewButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
        [self.view addSubview:_nextViewButton];
        [_nextViewButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _nextViewButton;
}

//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
//                                                                  presentingController:(UIViewController *)presenting
//                                                                      sourceController:(UIViewController *)source
//{
//    NavgationPopAnimator *popAnimator = [[NavgationPopAnimator alloc] init];
//    return popAnimator;
//}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showUnwind"]) {
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
