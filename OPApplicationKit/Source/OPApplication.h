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
 App notification methods to be overridden by subclass.
 */
-(void) launch:(NSNotification*)notification;
-(void) resignActive:(NSNotification*)notification;
-(void) becomeActive:(NSNotification*)notification;
-(void) enterBackground:(NSNotification*)notification;
-(void) enterForeground:(NSNotification*)notification;
-(void) memoryWarning:(NSNotification*)notification;

/**
 Remote and local notification methods to be overridden by subclass.
 */
-(void) remoteNotificationRegistrationSucceeded:(NSData*)deviceToken;
-(void) remoteNotificationRegistrationFailed:(NSNotification*)notification;
-(void) receivedRemoteNotification:(NSDictionary*)userInfo;
-(void) receivedLocalNotification:(UILocalNotification*)notification;

@end
