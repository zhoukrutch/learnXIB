//
//  NavgationPopAnimator.m
//  learnNavigationController
//
//  Created by tao on 16/8/2.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "NavgationPopAnimator.h"

@interface NavgationPopAnimator()
@property (weak, nonatomic) UIViewController* fromVc;

@end

@implementation NavgationPopAnimator
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* fromviewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    self.fromVc = fromviewController;
    CGRect fromOriginFrame = fromviewController.view.frame;
    CGRect fromOffsetFrame = CGRectOffset(fromOriginFrame, CGRectGetWidth(fromOriginFrame), 0);
    CGRect originFrame = toViewController.view.frame;
    CGRect originOffsetFrame = CGRectOffset(originFrame, - CGRectGetWidth(originFrame) / 4, 0);
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromviewController.view];
    
    toViewController.view.frame = originOffsetFrame;
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:fromviewController.view.bounds];
    fromviewController.view.layer.masksToBounds = NO;
    fromviewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    fromviewController.view.layer.shadowOffset = CGSizeMake(0, 0);
    fromviewController.view.layer.shadowOpacity = 0.3f;
    fromviewController.view.layer.shadowPath = shadowPath.CGPath;
    fromviewController.view.layer.shadowRadius = 5.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromviewController.view.frame = fromOffsetFrame;
                         toViewController.view.frame = originFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         toViewController.view.frame = originFrame;
                     }];

}

- (void)animationEnded:(BOOL)transitionCompleted {
    self.fromVc = nil;
}

@end
