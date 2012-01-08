//
//  OPManagedObject.m
//  OPKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPManagedObject.h"

@implementation OPManagedObject

-(void) willSave {
    
    // updates `createdAt` and `updatedAt` timestamps if they exist as attributes.
    if ([self isInserted])
    {
        NSDate *date = [NSDate date];
        
        if ([self respondsToSelector:@selector(setPrimitiveCreatedAt:)] && ! [self performSelector:@selector(primitiveCreatedAt)])
            [self performSelector:@selector(setPrimitiveCreatedAt:) withObject:date];
        
        if ([self respondsToSelector:@selector(setPrimitiveUpdatedAt:)])
            [self performSelector:@selector(setPrimitiveUpdatedAt:) withObject:date];
    }
    else if ([self isUpdated] && [self respondsToSelector:@selector(setPrimitiveUpdatedAt:)])
    {
        [self performSelector:@selector(setPrimitiveUpdatedAt:) withObject:[NSDate date]];
    }
}

@end
