//
//  OPAppDelegate.h
//  OPApplicationKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Please make a #define in your prefix header that sets `OPApplicationSubclass`
 to the custom subclass you made from `OPApplication`. Put this macro
 in your build settings.
 */
#ifndef OPApplicationSubclass
#define OPApplicationSubclass   OPApplication
#endif

@interface OPAppDelegate : UIResponder <UIApplicationDelegate>

@end
