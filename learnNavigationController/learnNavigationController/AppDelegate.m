//
//  AppDelegate.m
//  learnNavigationController
//
//  Created by tao on 16/7/26.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    RootViewController *root = [[RootViewController alloc] init];
//    root.title = @"Root View";
//    UINavigationController *nacController = [[UINavigationController alloc] init];
//    [nacController pushViewController:root animated:NO];
//    [self.window setRootViewController:nacController];
//    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    //创建文件并写入
    NSArray *rootPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [rootPath objectAtIndex:0];
    //NSString *documentDirectory = [rootPath lastObject];
    NSLog(@"%@",documentDirectory);
    NSString *plistPath = [documentDirectory stringByAppendingPathComponent:@"sanbox.plist"];
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *userDict = [[NSMutableDictionary alloc] init];
    [userDict setObject:@"krutch" forKey:@"krutch"];
    [userDict setObject:@"yidian" forKey:@"yidian"];
    [rootDict setObject:userDict forKey:@"login"];
    [rootDict writeToFile:plistPath atomically:YES];
    NSLog(@"%@",NSHomeDirectory());
    NSLog(@"写入成功");
    
    //读取数据
    NSMutableDictionary *searchData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSLog(@"%@",searchData);
    
    //修改数据
    NSMutableDictionary *dataList = [[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath] mutableCopy];
    NSMutableDictionary *loginData = [dataList objectForKey:@"login"];
    [loginData setObject:@"modified" forKey:@"modified"];
    [loginData setObject:@"code" forKey:@"code"];
    [dataList setObject:loginData forKey:@"login"];
    [dataList writeToFile:plistPath atomically:YES];
    //写入的数据覆盖之前的数据
//    NSMutableDictionary *test = [[NSMutableDictionary alloc] init];
//    [test setObject:@"test" forKey:@"test"];
//    [test writeToFile:plistPath atomically:YES];
    NSLog(@"修改成功");
    
    
    NSMutableDictionary *sData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSLog(@"%@",sData);
    //删除文件
//    NSFileManager *manager = [NSFileManager defaultManager];
//    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"sanbox.plist"];
//    [manager removeItemAtPath:filePath error:nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
