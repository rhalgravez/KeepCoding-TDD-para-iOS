//
//  AGTBroker.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGTMoney;

@interface AGTBroker : NSObject

-(AGTMoney *)reduce:(AGTMoney *)money toCurrency:(NSString *)currency;

@end
