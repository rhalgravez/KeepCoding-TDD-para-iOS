//
//  AGTMoney.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTMoney.h"
#import "NSObject+GNUStepAddones.h"
#import "AGTMoney-Private.h"
#import "AGTEuro.h"
#import "AGTDollar.h"

@implementation AGTMoney
#pragma mark - Class methods
+(id)euroWithAmount:(NSInteger)amount {
    return [[AGTEuro alloc] initWithAmount:amount];
}
+(id)dollarWithAmount:(NSInteger)amount{
    return [[AGTDollar alloc] initWithAmount:amount];
    
}

#pragma mark - Init
-(instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}

-(AGTMoney*)times:(NSInteger)multiplier {
    
    AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount: [self.amount integerValue] * multiplier ];
    
    return newMoney;
}

#pragma mark - Overwritten
-(NSString *)description {
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], [[self amount] integerValue]];
}

-(BOOL)isEqual:(id)object {
    return  [self amount] == [object amount];
}

-(NSUInteger)hash {
    return (NSUInteger) self.amount;
}

@end
