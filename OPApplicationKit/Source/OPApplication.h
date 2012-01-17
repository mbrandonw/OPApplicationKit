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

@end
