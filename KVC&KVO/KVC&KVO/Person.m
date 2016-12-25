//
//  Book.m
//  KVC&KVO
//
//  Created by tao on 16/8/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "Person.h"
static Person *person;


@interface Person()
@property (strong, nonatomic) NSArray *array;

@end

@implementation Person
+ (Person *)sharedPerson{
    
        return person;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        person = [super allocWithZone:zone];
        
    });
    
    return person;
}



- (instancetype)init{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        person = [super init];
        
    });
    self.array = [NSMutableArray array];
    return person;
}

- (id)copyWithZone:(NSZone *)zone{
    return person;
}



@end

@implementation Book

@end


- (void) openLoginVC:(HpInterestNavigationItem *) interestNavigationItem;

- (void) interestNavigationItemSelectedWithLogin:(HpInterestNavigationItem *)interestNavigationItem {
    if (interestNavigationItem.needVerify) {
        if ([HpSharedEngine user].userType == kHpUserTypeGuest){
            UIV2LoginViewController *vc = [HpUtil instantiateViewControllerWithIdentifier:kHpLoginViewController
                                                                             inStoryboard:kHpGuideViewStoryboard];
            vc.openPageDidLoginSuccess = ^ void (BOOL item){
                if (item) {
                    [self interestNavigationItemSelected:interestNavigationItem];
                }
            };
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            [self interestNavigationItemSelected:interestNavigationItem];
        }
    } else {
        [self interestNavigationItemSelected:interestNavigationItem];
    }
}

typedef void (^openPageDidLoginSucessBlock)(BOOL item);



@property (nonatomic, copy) openPageDidLoginSucessBlock openPageDidLoginSucess;


- (void)showMainView
{
    if (self.openPageDidLoginSucess) {
        BOOL openPage = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            //            if (self.presentingViewController) {
            //                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            //                self.openPageDidLoginSucess(openPage);
            //            } else if (self.navigationController) {
            //                [self.navigationController popViewControllerAnimated:YES];
            //                self.openPageDidLoginSucess(openPage);
            //            }
            if (self.navigationController) {
                [self.navigationController popViewControllerAnimated:YES];
                //self.openPageDidLoginSucess(openPage);
            }
            else if (self.presentedViewController) {
                [self.presentedViewController dismissViewControllerAnimated:NO completion:^(void) {
                    [self dismissViewControllerAnimated:NO completion:^(void) {
                        self.openPageDidLoginSucess(openPage);
                        self.openPageDidLoginSucess = nil;
                    }];
                }];
            }
            else {
                [self dismissViewControllerAnimated:NO completion:^(void){
                    self.openPageDidLoginSucess(openPage);
                }];
            }
            
        });
        
    } else{
        // Redirect To UIV2
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIV2MainTabBarController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"UIV2Main"];
        
        UINavigationController *nav=(UINavigationController *)[HpNavigator rootViewController];
        [nav setViewControllers:@[viewController] animated:NO];
    }
}
