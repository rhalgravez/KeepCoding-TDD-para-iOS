//
//  AGTMoney.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject

@property (nonatomic, readonly) NSString *currency;

+(id)euroWithAmount:(NSInteger)amount;
+(id)dollarWithAmount:(NSInteger)amount;

-(instancetype)initWithAmount:(NSInteger)amount currency:(NSString *)currency;

-(id)times:(NSInteger)multiplier;

-(AGTMoney *)plus:(AGTMoney *)other;

@end
