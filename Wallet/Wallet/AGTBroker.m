//
//  AGTBroker.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTBroker.h"


@interface AGTBroker ()

@end

@implementation AGTBroker

-(instancetype)init {
    if (self = [super init]) {
        _rates = [@{} mutableCopy];
    }
    return self;
}

-(AGTMoney *)reduce:(AGTMoney*)money toCurrency:(NSString *)currency {
    
    //double dispatch
    
    return [money reduceToCurrency:currency withBroker:self];
}

-(void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency
                                                      toCurrency:fromCurrency]];
}

#pragma mark - Utils
//Método para generar la key que se usará en el diccionario
-(NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    return [NSString stringWithFormat:@"%@->%@", fromCurrency, toCurrency];
}

@end
