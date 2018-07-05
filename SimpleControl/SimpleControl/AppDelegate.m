//
//  AppDelegate.m
//  SimpleControl
//
//  Created by Eric on 26/12/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "AppDelegate.h"
#import <CocoaLumberjack.h>
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface AppDelegate ()

@end

@implementation AppDelegate{
      FBMemoryProfiler *memoryProfiler;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    memoryProfiler = [[FBMemoryProfiler alloc] init];
    [memoryProfiler enable];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    DDLogError(@"demo test");
    DDLogError(@"[Error]:%@", @"输出错误信息");//输出错误信息
    DDLogWarn(@"[Warn]:%@", @"输出警告信息");//输出警告信息
    DDLogInfo(@"[Info]:%@", @"输出描述信息");//输出描述信息
    DDLogDebug(@"[Debug]:%@", @"输出调试信息");//输出调试信息
    DDLogVerbose(@"[Verbose]:%@", @"输出详细信息");//输出详细信息
    return YES;
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
