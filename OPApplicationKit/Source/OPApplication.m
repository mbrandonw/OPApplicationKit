//
//  OPApplication.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "OPApplication.h"

#if DEBUG && TARGET_IPHONE_SIMULATOR
@interface NSObject (OPApplication)
+(void) _enableRemoteInspector;
@end
#endif

@implementation OPApplication

+(OPApplication*) sharedApp {
    
#if OP_FORCE_OPAPPLICATION_MAIN_THREAD_ONLY
    NSAssert([NSThread isMainThread], @"");
#endif
    
    static OPApplication *sharedApp = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedApp = [[self alloc] init];
    });
    return sharedApp;
}

-(BOOL) finishLaunchingWithOptions:(NSDictionary*)launchOptions {
    
    /*
     This is a good place to stylings of OPViewController, OPTableViewController, OPNavigationController, OPBarButtonItem, etc...
     */
    
    // enables safari web inspector for debugging webviews (!!!) ... just go to http://localhost:9999 while a webview is visible
#if DEBUG && TARGET_IPHONE_SIMULATOR
    if ([NSClassFromString(@"WebView") instancesRespondToSelector:@selector(_enableRemoteInspector)])
        [NSClassFromString(@"WebView") _enableRemoteInspector];
#endif
    
    [self performSelector:@selector(delayedFinishLaunchingWithOptions:) withObject:launchOptions afterDelay:0.0f];
    
    return YES;
}

-(void) resignActive {
    
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    
    /* 
     This is a good place to save your default core data context, i.e.
    [[NSManagedObjectContext MR_defaultContext] save];
     */
}

-(void) becomeActive {
    
    [self performSelector:@selector(delayedBecomeActive) withObject:nil afterDelay:0.0f];
    
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

-(void) enterBackground {
    
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    /*
     This is a good place to clear your caches.
     */
}

-(void) enterForeground {
    
    [self performSelector:@selector(delayedEnterForeground) withObject:nil afterDelay:0.0f];
    
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

-(void) terminate {
    
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

-(void) receiveMemoryWarning {
    
    /* 
     This is a good place to clear your caches.
     */
}

-(void) remoteNotificationRegistrationSucceeded:(NSData*)deviceToken {
}

-(void) remoteNotificationRegistrationFailed:(NSError*)error {
}

-(void) receivedRemoteNotification:(NSDictionary*)userInfo {
}

-(void) receivedLocalNotification:(UILocalNotification*)notification {
}

-(BOOL) openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return YES;
}

-(void) delayedFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
}

-(void) delayedBecomeActive {
}

-(void) delayedEnterForeground {
}

@end
