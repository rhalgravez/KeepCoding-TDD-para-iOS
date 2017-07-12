//
//  AGTMoney.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGTMoney;
@class AGTBroker;

@protocol AGTMoney <NSObject>
-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency;

-(id<AGTMoney>)times:(NSInteger)multiplier;

-(id<AGTMoney>)plus:(AGTMoney *)other;

-(id<AGTMoney>)reduceToCurrency:(NSString *)currency withBroker:(AGTBroker *)broker;
@end

@interface AGTMoney : NSObject

@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;

+(id)euroWithAmount:(NSInteger)amount;
+(id)dollarWithAmount:(NSInteger)amount;

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency;
-(AGTMoney *)times:(NSInteger)multiplier;
-(AGTMoney *)reduceToCurrency:(NSString *)currency withBroker:(AGTBroker *)broker;
-(AGTMoney *)plus:(AGTMoney *)other;

@end
