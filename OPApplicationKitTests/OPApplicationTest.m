//
//  OPApplicationTest.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 1/18/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPApplication.h"
#import <GHUnitIOS/GHUnit.h>

@interface OPApplicationTest : GHTestCase
@end

#ifdef OP_FORCE_OPAPPLICATION_MAIN_THREAD_ONLY
#undef OP_FORCE_OPAPPLICATION_MAIN_THREAD_ONLY
#define OP_FORCE_OPAPPLICATION_MAIN_THREAD_ONLY YES
#endif

@implementation OPApplicationTest

-(void) testProxy {
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        GHAssertThrows([OPApplication sharedApp], @"");
    });
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        GHAssertNoThrow([OPApplication sharedApp], @"");
    });
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        GHAssertThrows([[OPApplication sharedApp] finishLaunchingWithOptions:nil], @"");
    });
    dispatch_sync(dispatch_get_main_queue(), ^{
        GHAssertNoThrow([[OPApplication sharedApp] finishLaunchingWithOptions:nil], @"");
    });
}

@end
