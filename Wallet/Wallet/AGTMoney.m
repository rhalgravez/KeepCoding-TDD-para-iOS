//
//  AGTMoney.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTMoney ()

@property (nonatomic, strong) NSNumber *amount;

@end

@implementation AGTMoney
#pragma mark - Class methods
+(id)euroWithAmount:(NSInteger)amount {
    return [[AGTMoney alloc] initWithAmount:amount currency:@"EUR"];
}
+(id)dollarWithAmount:(NSInteger)amount{
    return [[AGTMoney alloc] initWithAmount:amount currency:@"USD"];
    
}

#pragma mark - Init
//Cualquier texto se puedo poner en currency así que quizás deberíamos agregar código
//que verifique que el currency es EUR o USD, pero eso lo podemos dejar
//para tareas de 'algún día'
-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(AGTMoney *)times:(NSInteger)multiplier {
    
    AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount: [self.amount integerValue] * multiplier
                                                 currency:self.currency];
    
    return newMoney;
}

-(AGTMoney *)plus:(AGTMoney *)other {
    //Suponiendo que self y other tienen la misma divisa
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    AGTMoney *total = [[AGTMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

-(AGTMoney *)reduceToCurrency:(NSString *)currency withBroker:(AGTBroker *)broker {
    AGTMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                       toCurrency:currency]]
                   doubleValue];
    //1)Comprobamos que divisa de origen y destino son las mismas
    if ([self.currency isEqualToString:currency]) {
        result = self;
    } else if(rate == 0){
        //No hay tasa de conversión, excepción que te crió
        [NSException raise:@"NoCOnversionRateException"
                    format:@"Must have a conversion from %@ to %@",self.currency, currency];
    } else {
        //Tenemos conversión
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[AGTMoney alloc]
                  initWithAmount:newAmount
                  currency:currency];
    }
    
    return result;
}

#pragma mark - Overwritten
-(NSString *)description {
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], [[self amount] integerValue]];
}

-(BOOL)isEqual:(id)object {
    
    if ([self.currency isEqual:[object currency]]) {
        return  [self amount] == [object amount];
    } else {
        return NO;
    }
    
}

-(NSUInteger)hash {
    return [self.amount integerValue];
}

@end
