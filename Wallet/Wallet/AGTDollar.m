//
//  AGTDollar.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTDollar.h"
#import "AGTMoney-Private.h"

@implementation AGTDollar

-(AGTDollar *)times:(NSInteger)multiplier {
    AGTDollar *newDollar = [[AGTDollar alloc] initWithAmount: self.amount * multiplier ];
    
    return newDollar;
}

@end
