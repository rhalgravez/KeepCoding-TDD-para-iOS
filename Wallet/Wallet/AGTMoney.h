//
//  AGTMoney.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject

+(instancetype)euroWithAmount:(NSInteger)amount;
+(instancetype)dollarWithAmount:(NSInteger)amount;

-(instancetype)initWithAmount:(NSInteger)amount;

-(AGTMoney*)times:(NSInteger)multiplier;

@end
