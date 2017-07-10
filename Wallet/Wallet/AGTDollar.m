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

-(instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

-(AGTDollar *)times:(NSInteger)multiplier {
    AGTDollar *newDollar = [[AGTDollar alloc] initWithAmount: self.amount * multiplier ];
    
    return newDollar;
}

#pragma mark - Overwriten
-(BOOL)isEqual:(id)object {
    return  [self amount] == [object amount];
}

-(NSUInteger)hash {
    return (NSUInteger) self.amount;
}

@end
