//
//  OPApplication.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "OPApplication.h"
#import "OPMacros.h"

#if defined(DEBUG) && TARGET_IPHONE_SIMULATOR
@interface NSObject (OPApplication)
+(void) _enableRemoteInspector;
@end
#endif

@implementation OPApplication

OP_SYNTHESIZE_SINGLETON_FOR_CLASS(OPApplication, sharedApp);

-(id) init {
    if (! (self = [super init]))
        return nil;
    
    // listen for global app notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(launch:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    
    return self;
}

-(void) launch:(NSNotification*)notification {
    
    // this is a good place to stylings of OPViewController, OPTableViewController, OPNavigationViewController, OPBarButtonItem, etc...
    
    
#if defined(DEBUG) && TARGET_IPHONE_SIMULATOR
    // enables safari web inspector for debugging webviews (!!!) ... just go to http://localhost:9999 while a webview is visible
    [NSClassFromString(@"WebView") _enableRemoteInspector];
#endif
}

-(void) resignActive:(NSNotification*)notification {
    
    // this is a good place to save your default core data context, i.e.
    //[[NSManagedObjectContext MR_defaultContext] save];
}

-(void) becomeActive:(NSNotification*)notification {
}

-(void) enterBackground:(NSNotification*)notification {
    
    // this is a good place to clear your shared NSCache, i.e.
    //[[NSCache sharedCache] removeAllObjects];
}

-(void) enterForeground:(NSNotification*)notification {
}

-(void) memoryWarning:(NSNotification*)notification {
    
    // this is a good place to clear your shared NSCache, i.e.
    //[[NSCache sharedCache] removeAllObjects];
}

-(void) remoteNotificationRegistrationSucceeded:(NSData*)deviceToken {
}

-(void) remoteNotificationRegistrationFailed:(NSNotification*)notification {
}

-(void) receivedRemoteNotification:(NSDictionary*)userInfo {
}

-(void) receivedLocalNotification:(UILocalNotification*)notification {
}

@end
