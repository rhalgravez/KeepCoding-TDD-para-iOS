//
//  AGTBroker.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"

@interface AGTBroker ()

//Proeprty para llevar registro de las divisas y sus tasas de cambio
@property (nonatomic, strong) NSMutableDictionary *rates;

@end

@implementation AGTBroker

-(instancetype)init {
    if (self = [super init]) {
        _rates = [@{} mutableCopy];
    }
    return self;
}

-(AGTMoney *)reduce:(AGTMoney *)money toCurrency:(NSString *)currency {
    return money;
    
}

-(void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
}

#pragma mark - Utils
//Método para generar la key que se usará en el diccionario
-(NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    return [NSString stringWithFormat:@"%@->%@", fromCurrency, toCurrency];
}

@end
