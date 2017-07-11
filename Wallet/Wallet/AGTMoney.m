//
//  AGTMoney.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTMoney.h"

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
-(instancetype)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id)times:(NSInteger)multiplier {
    
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
    return (NSUInteger) self.amount;
}

@end
