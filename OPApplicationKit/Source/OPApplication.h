//
//  OPApplication.h
//  OPKit
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
-(void) windDown;
-(void) windUp;

@end
