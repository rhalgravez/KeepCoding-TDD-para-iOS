//
//  AGTDollar.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTDollar.h"

@interface AGTDollar ()

@property (nonatomic) NSInteger amount;

@end

@implementation AGTDollar

-(AGTDollar *)times:(NSInteger)multiplier {
    AGTDollar *newDollar = [[AGTDollar alloc] initWithAmount: self.amount * multiplier ];
    
    return newDollar;
}

@end
