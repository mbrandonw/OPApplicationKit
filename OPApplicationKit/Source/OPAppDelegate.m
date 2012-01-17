//
//  OPAppDelegate.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPAppDelegate.h"
#import "OPApplication.h"

@implementation OPAppDelegate

-(void) applicationDidBecomeActive:(UIApplication *)application {
    [[OPApplicationSubclass sharedApp] becomeActive];
}

-(void) applicationWillResignActive:(UIApplication *)application {
    [[OPApplicationSubclass sharedApp] resignActive];
}

-(void) applicationDidEnterBackground:(UIApplication *)application {
    [[OPApplicationSubclass sharedApp] enterBackground];
}

-(void) applicationWillEnterForeground:(UIApplication *)application {
    [[OPApplicationSubclass sharedApp] enterForeground];
}

-(void) applicationWillTerminate:(UIApplication *)application {
    [[OPApplicationSubclass sharedApp] terminate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return [[OPApplicationSubclass sharedApp] finishLaunchingWithOptions:launchOptions];
}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    // just forward to the more robust method
    return [self application:application openURL:url sourceApplication:nil annotation:nil];
}

-(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[OPApplicationSubclass sharedApp] openURL:url sourceApplication:sourceApplication annotation:annotation];
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application {
}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[OPApplicationSubclass sharedApp] receivedRemoteNotification:userInfo];
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[OPApplicationSubclass sharedApp] remoteNotificationRegistrationSucceeded:deviceToken];
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[OPApplicationSubclass sharedApp] remoteNotificationRegistrationFailed:error];
}

-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [[OPApplicationSubclass sharedApp] receivedLocalNotification:notification];
}

@end
