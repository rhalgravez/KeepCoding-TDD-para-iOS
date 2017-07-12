//
//  AGTWallet.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTWallet.h"
#import "AGTMoney.h"

@import UIKit;

@interface AGTWallet ()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation AGTWallet

-(NSUInteger *)count {
    return [self.moneys count];
}

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<AGTMoney>)plus:(AGTMoney *)other {
    [self.moneys addObject:other];
    
    return self;
}

-(id<AGTMoney>)times:(NSInteger)multiplier {
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (AGTMoney *each in self.moneys) {
        AGTMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    
    self.moneys = newMoneys;
    
    return self;
}

-(AGTMoney *)reduceToCurrency:(NSString *)currency withBroker:(AGTBroker *)broker {
    AGTMoney *result = [[AGTMoney alloc] initWithAmount:0 currency:currency];
    
    for (AGTMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
                  
    return result;
}

#pragma mark -Notifications
-(void)subscribeToMemoryWarning:(NSNotificationCenter *)nc {
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void)dumpToDisk:(NSNotification *)notifiation {
    //guardar las cosas en disco cuando la cosa se pone fea
}
@end
