//
//  AppDelegate.m
//  3D_TOUCH
//
//  Created by 周勇 on 17/12/26.
//  Copyright © 2017年 周勇. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#include "DragonViewController.h"
#include "BSTableViewController.h"
#import "WidgetTestViewController.h"

@interface AppDelegate ()

@property (nonatomic, assign) UIForceTouchCapability forceTouchCapability;

@end

@implementation AppDelegate


//3D touch功能（常用APP  支付宝  天猫乘车码）


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    self.window.rootViewController = navc;
    self.window.backgroundColor = [UIColor whiteColor];

    [self create3DTouchShotItems];
    
    return YES;
}

- (void)create3DTouchShotItems {
    //创建快捷item的icon UIApplicationShortcutItemIconFile
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"bmw"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"bird"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"home"];
    
    //创建快捷item的userinfo UIApplicationShortcutItemUserInfo
    NSDictionary *info1 = @{@"url":@"url1"};
    NSDictionary *info2 = @{@"url":@"url2"};
    NSDictionary *info3 = @{@"url":@"url3"};
    
    
    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"bmw" localizedTitle:@"扫辆宝马" localizedSubtitle:@"" icon:icon1 userInfo:info1];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"bird" localizedTitle:@"smile" localizedSubtitle:@"微笑面对生活" icon:icon2 userInfo:info2];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"home" localizedTitle:@"购物" localizedSubtitle:@"Shopping" icon:icon3 userInfo:info3];
    
    NSArray *items = @[item1, item2, item3];
    [UIApplication sharedApplication].shortcutItems = items;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    UINavigationController *navc =  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([shortcutItem.type isEqualToString:@"dog"]) {
        NSLog(@"狗狗。。。。");
        [navc pushViewController:[BSTableViewController new] animated:YES];
    }else if ([shortcutItem.type isEqualToString:@"dragon"]){
        NSLog(@"龙龙。。。。");
        [navc pushViewController:[DragonViewController new] animated:YES];
    }else if ([shortcutItem.type isEqualToString:@"bmw"]){
        NSLog(@"宝马来啦啦啦");
    }else if([shortcutItem.type isEqualToString:@"bird"]){
        NSLog(@"鸟来啦。。。。。");
    }else if ([shortcutItem.type isEqualToString:@"home"]){
        NSLog(@"home。。。。。");
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
    
}


// 所有版本的都可以使用
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    [self appCallbackWithOpenUrl:url];
    
    return YES;
}

/// iOS 8 以后
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {

    [self appCallbackWithOpenUrl:url];

    return YES;
}

/// iOS 7
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {

    [self appCallbackWithOpenUrl:url];

    return YES;
}

- (void)appCallbackWithOpenUrl:(NSURL *)url{
    
    NSLog(@"widget 打开 APP ---> url: %@", url.host);
    
    UINavigationController *navc =  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [navc pushViewController:[WidgetTestViewController new] animated:YES];

    // 针对url进行不同的操作
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
