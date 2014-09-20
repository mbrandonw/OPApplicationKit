//
//  OPApp.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 9/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "OPApp.h"

@implementation OPApp

static OPApp *_sharedApp = nil;
static dispatch_once_t _onceToken = 0;
+(instancetype) singletonMethod {
  dispatch_once(&_onceToken, ^{
    if (! _sharedApp) {
      _sharedApp = [[[self class] alloc] init];
    }
  });
  return _sharedApp;
}

-(UIWindow*) window {
  return [[[UIApplication sharedApplication] delegate] window];
}

-(BOOL) finishLaunchingWithOptions:(NSDictionary*)launchOptions {
  /*
   This is a good place to stylings of OPViewController, OPTableViewController, OPNavigationController, OPBarButtonItem, etc.
   In fact, put only the bare minimum needed to show something on the screen here, and leave other initialization stuff for
   the -delayedFinishLaunchingWithOptions:, which is called on the next run loop.
   */

  dispatch_async(dispatch_get_main_queue(), ^{
    NSUInteger currentBuild = [[NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"] integerValue];

    // sometimes we wanna run one-off blocks of code for each build
    NSString *buildKey = @"OPApplication_one_offs_previous_build";
    NSUInteger previousBuild = [[[NSUserDefaults standardUserDefaults] objectForKey:buildKey] integerValue];
    if (previousBuild > 0 && previousBuild != currentBuild) {
      [self oneTimeSetup:NSMakeRange(previousBuild, currentBuild-previousBuild)];
    }
    [[NSUserDefaults standardUserDefaults] setObject:@(currentBuild) forKey:buildKey];
    [[NSUserDefaults standardUserDefaults] synchronize];

    if ([self respondsToSelector:@selector(delayedFinishLaunchingWithOptions:)]) {
      [self delayedFinishLaunchingWithOptions:launchOptions];
    }
  });

  return YES;
}

-(void) resignActive {
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

-(void) becomeActive {
  if ([self respondsToSelector:@selector(delayedBecomeActive)]) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [self delayedBecomeActive];
    });
  }

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
   This is a good place to clear your caches and save your NSManagedObjectContext instances.
   */

  if ([self respondsToSelector:@selector(delayedEnterBackground)]) {

    UIBackgroundTaskIdentifier identifier = [UIApplication.sharedApplication beginBackgroundTaskWithExpirationHandler:nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
      [self delayedEnterBackground];
      [UIApplication.sharedApplication endBackgroundTask:identifier];
    });
  }
}

-(void) enterForeground {

  if ([self respondsToSelector:@selector(delayedEnterForeground)]) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [self delayedEnterForeground];
    });
  }

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

  if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)
  {
    [self receivedActiveRemoteNotification:userInfo];
  }
  else
  {
    [self receivedInactiveRemoteNotification:userInfo];
  }
}

-(void) receivedLocalNotification:(UILocalNotification*)notification {
}

-(BOOL) openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return YES;
}


-(void) receivedActiveRemoteNotification:(NSDictionary *)userInfo {
}

-(void) receivedInactiveRemoteNotification:(NSDictionary *)userInfo {
}

-(void) oneTimeSetup:(NSRange)buildRange {
}

@end
