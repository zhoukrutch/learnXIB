//
//  PopNavigationViewController.m
//  learnNavigationController
//
//  Created by tao on 16/8/2.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "NavgationPopAnimator.h"
#import "PopNavigationViewController.h"

@interface PopNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *perecentDrivenInteractive;
@end

@implementation PopNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handPopGesture:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)handPopGesture:(UIScreenEdgePanGestureRecognizer *)gesture{
    CGFloat progress = [gesture translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.perecentDrivenInteractive = [[UIPercentDrivenInteractiveTransition alloc] init];
        
        [self popViewControllerAnimated:YES];
    }
    else if(gesture.state == UIGestureRecognizerStateChanged){
        [self.perecentDrivenInteractive updateInteractiveTransition:progress];
    }
    else if(gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled){
        if (progress > 0.5) {
            [self.perecentDrivenInteractive finishInteractiveTransition];
        } else {
            [self.perecentDrivenInteractive cancelInteractiveTransition];
        }
        self.perecentDrivenInteractive = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return [[NavgationPopAnimator alloc] init];
    } else {
        return nil;
    }
}


-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                        interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return self.perecentDrivenInteractive;
}


@end
