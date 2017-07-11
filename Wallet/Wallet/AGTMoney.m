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

@implementation AGTMoney

-(instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}

-(AGTMoney*)times:(NSInteger)multiplier {
    //No se debe llamar, sino que se debe usar la de subclase
    
    return [self subclassResponsability:_cmd];
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
