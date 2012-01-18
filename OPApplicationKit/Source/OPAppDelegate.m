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

@synthesize applicationClass;

-(void) applicationDidBecomeActive:(UIApplication *)application {
    [[self.applicationClass sharedApp] becomeActive];
}

-(void) applicationWillResignActive:(UIApplication *)application {
    [[self.applicationClass sharedApp] resignActive];
}

-(void) applicationDidEnterBackground:(UIApplication *)application {
    [[self.applicationClass sharedApp] enterBackground];
}

-(void) applicationWillEnterForeground:(UIApplication *)application {
    [[self.applicationClass sharedApp] enterForeground];
}

-(void) applicationWillTerminate:(UIApplication *)application {
    [[self.applicationClass sharedApp] terminate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [[self.applicationClass sharedApp] finishLaunchingWithOptions:launchOptions];
}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    // just forward to the more robust method
    return [self application:application openURL:url sourceApplication:nil annotation:nil];
}

-(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[self.applicationClass sharedApp] openURL:url sourceApplication:sourceApplication annotation:annotation];
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application {
    return [[self.applicationClass sharedApp] receiveMemoryWarning];
}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[self.applicationClass sharedApp] receivedRemoteNotification:userInfo];
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[self.applicationClass sharedApp] remoteNotificationRegistrationSucceeded:deviceToken];
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[self.applicationClass sharedApp] remoteNotificationRegistrationFailed:error];
}

-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [[self.applicationClass sharedApp] receivedLocalNotification:notification];
}

@end
