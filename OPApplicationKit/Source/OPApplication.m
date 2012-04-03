//
//  OPApplication.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "OPApplication.h"
#import "UIApplication+Opetopic.h"
#import "OPTabBarController.h"
#import "OPMacros.h"

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
    DLogClassAndMethod();
    
    /*
     This is a good place to stylings of OPViewController, OPTableViewController, OPNavigationController, OPBarButtonItem, etc. 
     In fact, put only the bare minimum needed to show something on the screen here, and leave other initialization stuff for
     the -delayedFinishLaunchingWithOptions:, which is called on the next run loop.
     */
    
    // enables safari web inspector for debugging webviews (!!!) ... just go to http://localhost:9999 while a webview is visible
#if DEBUG && TARGET_IPHONE_SIMULATOR
    if ([NSClassFromString(@"WebView") instancesRespondToSelector:@selector(_enableRemoteInspector)])
        [NSClassFromString(@"WebView") _enableRemoteInspector];
#endif
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self delayedFinishLaunchingWithOptions:launchOptions];
    });
    
    return YES;
}

-(void) resignActive {
    DLogClassAndMethod();
    
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

-(void) becomeActive {
    DLogClassAndMethod();
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self delayedBecomeActive];
    });
    
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

-(void) enterBackground {
    DLogClassAndMethod();
    
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    /*
     This is a good place to clear your caches and save your NSManagedObjectContext instances.
     */
    
    [[UIApplication sharedApplication] performBackgroundTask:^{
        [self delayedEnterBackground];
    } completion:nil expiration:nil];
    
    // clear out any view controllers that are not immediately front and center
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if ([window.rootViewController isKindOfClass:[OPTabBarController class]])
    {
        // if we are dealing with a tab bar controller, then we try the unselected tabs' navigation stacks
        OPTabBarController *tabBarController = (OPTabBarController*)window.rootViewController;
        for (UIViewController *controller in tabBarController.viewControllers)
        {
            if (controller != tabBarController.selectedViewController && [controller isKindOfClass:[UINavigationController class]])
                [(UINavigationController*)controller popToRootViewControllerAnimated:NO];
        }
    }
}

-(void) enterForeground {
    DLogClassAndMethod();
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self delayedEnterForeground];
    });
    
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

-(void) terminate {
    DLogClassAndMethod();
    
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

-(void) receiveMemoryWarning {
    DLogClassAndMethod();
    
    /* 
     This is a good place to clear your caches.
     */
}

-(void) remoteNotificationRegistrationSucceeded:(NSData*)deviceToken {
    DLogClassAndMethod();
}

-(void) remoteNotificationRegistrationFailed:(NSError*)error {
    DLogClassAndMethod();
}

-(void) receivedRemoteNotification:(NSDictionary*)userInfo {
    DLogClassAndMethod();
}

-(void) receivedLocalNotification:(UILocalNotification*)notification {
    DLogClassAndMethod();
}

-(BOOL) openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    DLogClassAndMethod();
    return YES;
}

-(void) delayedFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    DLogClassAndMethod();
}

-(void) delayedBecomeActive {
    DLogClassAndMethod();
}

-(void) delayedEnterBackground {
    DLogClassAndMethod();
}

-(void) delayedEnterForeground {
    DLogClassAndMethod();
}

@end
