//
//  OPApp.h
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** OPApp
 
 A sensible base class for an application singleton.
 */
@import Foundation;
@import UIKit;
#import "OPMacros.h"

/**
 Determines if you want to force all access to OPApp to be on the main
 thread, i.e. raises an exception if you try to call methods from another thread.
 Throw this macro in your build settings.
 */
//#define OP_FORCE_OPAPPLICATION_MAIN_THREAD_ONLY 1

@protocol OPApplicationDelegate <NSObject>
@optional
/**
 Delayed versions of various application delegate methods. These methods are called
 on the next pass of the run loop after their corresponding non-delayed versions are called. Putting as much
 set up / tear down code in these methods as possible helps the app start up quickly.
 */
-(void) delayedFinishLaunchingWithOptions:(NSDictionary*)launchOptions;
-(void) delayedBecomeActive;
-(void) delayedEnterBackground; // WARNING: not called on the main thread as it is wrapped in a UIApplication background task
-(void) delayedEnterForeground;

@end

@interface OPApp : NSObject <OPApplicationDelegate>

OP_SINGLETON_HEADER_FOR(OPApp, sharedApp)

@property (nonatomic, readonly) UIWindow *window;

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
-(void) userNotificationRegistrationSucceeded:(UIUserNotificationSettings*)settings;
-(void) remoteNotificationRegistrationFailed:(NSError*)error;
-(void) receivedRemoteNotification:(NSDictionary*)userInfo;
-(void) receivedLocalNotification:(UILocalNotification*)notification;

/**
 New application delegate methods for convenience.
 */
-(void) receivedInactiveRemoteNotification:(NSDictionary*)userInfo;
-(void) receivedActiveRemoteNotification:(NSDictionary*)userInfo;

/**
 Called once on launch each time the build version of the app changes.
 */
-(void) oneTimeSetup:(NSRange)buildRange;

@end
