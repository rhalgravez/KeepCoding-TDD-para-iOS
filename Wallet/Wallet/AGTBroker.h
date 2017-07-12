//
//  AGTBroker.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"


@interface AGTBroker : NSObject

//Proeprty para llevar registro de las divisas y sus tasas de cambio
@property (nonatomic, strong) NSMutableDictionary *rates;

-(AGTMoney *)reduce:(AGTMoney *)money toCurrency:(NSString *)currency;
-(void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;

-(NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
@end
