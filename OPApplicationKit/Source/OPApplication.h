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

/**
 Determines if you want to force all access to OPApplication to be on the main
 thread, i.e. raises an exception if you try to call methods from another thread.
 Throw this macro in your build settings.
 */
//#define OP_FORCE_OPAPPLICATION_MAIN_THREAD_ONLY 1

@interface OPApplication : NSObject

+(id) sharedApp;

/**
 All of the UIApplicationDelegate methods forwarded to us from OPAppDeleate.
 */
-(BOOL) finishLaunchingWithOptions:(NSDictionary*)launchOptions;
-(void) becomeActive;
-(void) resignActive;
-(void) enterBackground;
-(void) enterForeground;
-(void) terminate;
-(BOOL) openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
-(void) receiveMemoryWarning;
-(void) remoteNotificationRegistrationSucceeded:(NSData*)deviceToken;
-(void) remoteNotificationRegistrationFailed:(NSError*)error;
-(void) receivedRemoteNotification:(NSDictionary*)userInfo;
-(void) receivedLocalNotification:(UILocalNotification*)notification;

/**
 Delayed versions of the -finishLaunch, -becomeActive and -enterForeground methods. These methods are called
 on the next pass of the run loop after their corresponding non-delayed versions are called. Putting as much
 set up code in these methods as possible helps the app start up as quickly.
 */
-(void) delayedFinishLaunchingWithOptions:(NSDictionary*)launchOptions;
-(void) delayedBecomeActive;
-(void) delayedResignActive;
-(void) delayedEnterBackground;
-(void) delayedEnterForeground;

@end
