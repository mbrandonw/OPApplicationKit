//
//  OPApplication.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "OPApplication.h"

#if defined(DEBUG) && TARGET_IPHONE_SIMULATOR
@interface NSObject (OPApplication)
+(void) _enableRemoteInspector;
@end
#endif

@implementation OPApplication

+(OPApplication*) sharedApp {
    
    static OPApplication *sharedApp = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedApp = [[self alloc] init];
    });
    return sharedApp;
}

-(id) init {
    if (! (self = [super init]))
        return nil;
    
    // listen for global app notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(launch:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(terminate:) name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    
    return self;
}

-(void) launch:(NSNotification*)notification {
    
    /*
     This is a good place to stylings of OPViewController, OPTableViewController, OPNavigationViewController, OPBarButtonItem, etc...
     */
    
    
#if defined(DEBUG) && TARGET_IPHONE_SIMULATOR
    // enables safari web inspector for debugging webviews (!!!) ... just go to http://localhost:9999 while a webview is visible
    [NSClassFromString(@"WebView") _enableRemoteInspector];
#endif
}

-(void) resignActive:(NSNotification*)notification {
    
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    
    /* 
     This is a good place to save your default core data context, i.e.
    [[NSManagedObjectContext MR_defaultContext] save];
     */
}

-(void) becomeActive:(NSNotification*)notification {
    
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

-(void) enterBackground:(NSNotification*)notification {
    
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    /*
     This is a good place to clear your shared NSCache, i.e.
    [[NSCache sharedCache] removeAllObjects];
     */
}

-(void) enterForeground:(NSNotification*)notification {
    
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

-(void) terminate:(NSNotification*)notification {
    
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

-(void) memoryWarning:(NSNotification*)notification {
    
    /* 
     This is a good place to clear your shared NSCache, i.e.
    [[NSCache sharedCache] removeAllObjects];
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

-(void) openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
}

@end
