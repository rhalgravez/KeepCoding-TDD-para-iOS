//
//  AGTFakeNotificationCenter.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTFakeNotificationCenter.h"

@implementation AGTFakeNotificationCenter

-(instancetype)init {
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)addObserver:(id)observer
          selector:(SEL)aSelector
              name:(nullable NSNotificationName)aName
            object:(nullable id)anObject {
    
    [self.observers setObject:observer forKey:aName];
}

@end
