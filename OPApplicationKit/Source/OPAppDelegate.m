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

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    [[OPApplication sharedApp] remoteNotificationRegistrationFailed:error];
}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [[OPApplication sharedApp] receivedRemoteNotification:userInfo];
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [[OPApplication sharedApp] remoteNotificationRegistrationSucceeded:deviceToken];
}

-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    [[OPApplication sharedApp] receivedLocalNotification:notification];
}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    [self application:application openURL:url sourceApplication:nil annotation:nil];
    return YES;
}

-(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return YES;
}

@end
