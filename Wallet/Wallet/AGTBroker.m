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
    
    AGTMoney *result;
    double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                          toCurrency:currency]]
                      doubleValue];
    //1)Comprobamos que divisa de origen y destino son las mismas
    if ([money.currency isEqualToString:currency]) {
        result = money;
    } else if(rate == 0){
        //No hay tasa de conversión, excepción que te crió
        [NSException raise:@"NoCOnversionRateException"
                    format:@"Must have a conversion from %@ to %@",money.currency, currency];
    } else {
        //Tenemos conversión
        NSInteger newAmount = [money.amount integerValue] * rate;
        
        result = [[AGTMoney alloc]
                              initWithAmount:newAmount
                              currency:currency];
    }
    
    return result;
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
