//
//  AGTMoney.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTMoney.h"

@interface AGTMoney ()

@property (nonatomic) NSInteger amount;

@end

@implementation AGTMoney

-(instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

-(AGTMoney*)times:(NSInteger)multiplier {
    //No se debe llamar, sino que se debe usar la de subclase
    
    return self;
}

@end
