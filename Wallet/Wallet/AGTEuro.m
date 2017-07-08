//
//  AGTEuro.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/7/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTEuro.h"

@interface AGTEuro()

@property (nonatomic) NSInteger amount;

@end

@implementation AGTEuro

-(instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

@end
