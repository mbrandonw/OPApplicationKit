//
//  OPApplication.h
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** OPApplication
 
 A sensible base class for an application singleton.
 */
#import <Foundation/Foundation.h>

@interface OPApplication : NSObject

+(id) sharedApp;

/**
 Global application notification methods to be overridden by subclass. These methods
 are called by observing the appropriate NSNotification key.
 */
-(void) launch:(NSNotification*)notification;
-(void) resignActive:(NSNotification*)notification;
-(void) becomeActive:(NSNotification*)notification;
-(void) enterBackground:(NSNotification*)notification;
-(void) enterForeground:(NSNotification*)notification;
-(void) terminate:(NSNotification*)notification;
-(void) memoryWarning:(NSNotification*)notification;

/**
 Remote and local notification methods to be overridden by subclass. The OPAppDelegate 
 base class calls these methods when it receives the corresponding notification.
 */
-(void) remoteNotificationRegistrationSucceeded:(NSData*)deviceToken;
-(void) remoteNotificationRegistrationFailed:(NSError*)error;
-(void) receivedRemoteNotification:(NSDictionary*)userInfo;
-(void) receivedLocalNotification:(UILocalNotification*)notification;

/**
 Opening URLs. The OPAppDelegate base class calls this method when it receives the corresponding notification.
 */
-(void) openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
