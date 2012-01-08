//
//  OPApplication.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "OPApplication.h"
#import "NSCache+Opetopic.h"
#import "OPMacros.h"
#import "CoreData+MagicalRecord.h"

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
    
    // clear cache when leaving app
    [[NSNotificationCenter defaultCenter] addObserver:[NSCache sharedCache] selector:@selector(removeAllObjects) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    // do stuff on start up and exit
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windDown) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windUp) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    return self;
}


#pragma mark Notification methods
-(void) windDown {
    [[NSManagedObjectContext MR_defaultContext] MR_save];
}

-(void) windUp {
    
#if defined(DEBUG) && TARGET_IPHONE_SIMULATOR
    // enables safari web inspector for debugging webviews (!!!) ... just go to http://localhost:9999 while a webview is visible
    [NSClassFromString(@"WebView") _enableRemoteInspector];
#endif
}

@end
