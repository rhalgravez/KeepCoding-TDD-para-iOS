//
//  NSObject+GNUStepAddones.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//
#import <objc/runtime.h>
#import "NSObject+GNUStepAddones.h"

@implementation NSObject (GNUStepAddones)

-(id)subclassResponsability:(SEL)aSel {
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    
    [NSException raise:NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its sublass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self; //Not reached
}

@end
